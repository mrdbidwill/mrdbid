# Mycowriter Gem Integration - Complete Steps

## Current Status
✅ Gem created at `../mycowriter_gem/mycowriter/` (v0.1.1)
✅ Gem added to Gemfile and bundle installed
✅ Routes mounted: `/mycowriter`
✅ Initializer created: `config/initializers/mycowriter.rb`
✅ Stimulus controller registered in `application.js`
✅ `mb_lists` table already exists in mrdbid (no migration needed!)

## What's Left To Do

### STEP 1: Update Views - Replace Old Controller with Gem Controller

**Files to update:**
- `app/views/mushrooms/_form.html.erb` (4 instances - genera, species, trees, plants)

**Changes needed:**

**OLD (tokens controller):**
```erb
<div data-controller="tokens"
     data-tokens-url-value="<%= genera_autocomplete_path(format: :json) %>"
     data-tokens-min-value="3"
     data-tokens-mushroom-id-value="<%= mushroom.id %>"
     data-tokens-kind-value="genera">

  <input data-tokens-target="input"
         data-action="input->tokens#onInput"
         minlength="3"
         placeholder="Type at least 3 letters...">

  <ul data-tokens-target="dropdown"></ul>
  <div data-tokens-target="list">...</div>
  <input type="hidden" data-tokens-target="hiddenIds">
</div>
```

**NEW (mycowriter--autocomplete controller):**
```erb
<div data-controller="mycowriter--autocomplete"
     data-mycowriter--autocomplete-url-value="<%= mycowriter.genera_autocomplete_path %>"
     data-mycowriter--autocomplete-min-value="4"
     data-mycowriter--autocomplete-mushroom-id-value="<%= mushroom.id %>"
     data-mycowriter--autocomplete-kind-value="genera">

  <input data-mycowriter--autocomplete-target="input"
         minlength="4"
         placeholder="Type genus name (e.g., Agaricus)...">

  <ul data-mycowriter--autocomplete-target="dropdown"></ul>
  <div data-mycowriter--autocomplete-target="list">...</div>
  <input type="hidden" data-mycowriter--autocomplete-target="hiddenIds">
</div>
```

**Key changes:**
1. `data-controller="tokens"` → `data-controller="mycowriter--autocomplete"`
2. `data-tokens-*` → `data-mycowriter--autocomplete-*`
3. `minlength="3"` → `minlength="4"`
4. Update route: `genera_autocomplete_path` → `mycowriter.genera_autocomplete_path`
5. Remove `data-action="input->tokens#onInput"` (automatic in gem)
6. Update button actions: `tokens#removeToken` → `mycowriter--autocomplete#removeToken`

**Lines to update in _form.html.erb:**
- Line 328-363 (Genera section)
- Line 373-410 (Species section)
- Line 479-515 (Trees section)
- Line 534-570 (Plants section)

### STEP 2: Remove Old Code Files (No Longer Needed)

**Delete these files:**
```bash
rm app/javascript/controllers/tokens_controller.js
rm app/controllers/autocomplete_controller.rb  # Only if ONLY used for genus/species
```

**WAIT!** Check if `autocomplete_controller.rb` has other methods:
- If it has `mr_characters`, `trees`, `plants` methods used elsewhere, keep the file but remove only `genera` and `species` methods
- Gem provides: `genera`, `species`
- You still need local routes for: `trees`, `plants`, `mr_characters` autocomplete

### STEP 3: Update Routes

**Current routes to KEEP:**
```ruby
# Keep these - not provided by gem
get "autocomplete/trees", to: "autocomplete#trees", as: :trees_autocomplete
get "autocomplete/plants", to: "autocomplete#plants", as: :plants_autocomplete
get "autocomplete/mr_characters", to: "autocomplete#mr_characters", as: :mr_characters_autocomplete
```

**Routes to REMOVE (provided by gem):**
```ruby
# DELETE THESE - gem provides them
get "autocomplete/genera", to: "autocomplete#genera", as: :genera_autocomplete
get "autocomplete/species", to: "autocomplete#species", as: :species_autocomplete
```

**Gem provides these routes (via mount):**
- `/mycowriter/autocomplete/genera`
- `/mycowriter/autocomplete/species`

### STEP 4: Database - You're Good!

✅ **Your `mb_lists` table already exists**
✅ **No migration needed**
✅ **Data already populated**

The gem will use your existing table automatically.

### STEP 5: Test the Integration

1. **Restart Rails server:**
   ```bash
   rails restart  # or kill and restart server
   ```

2. **Test genus autocomplete:**
   - Go to mushroom edit page
   - Type "Agar" (uppercase A, 4+ letters)
   - Should see "Agaricus" in dropdown
   - Test lowercase "agar" - should see validation message

3. **Test species autocomplete:**
   - Add a genus first
   - Type species name
   - Should filter by selected genus

4. **Check for JavaScript errors:**
   - Open browser console (F12)
   - Look for any controller registration errors

### STEP 6: Publishing to RubyGems.org

**Same process as auto_glossary:**

```bash
cd ../mycowriter_gem/mycowriter

# Build the gem
gem build mycowriter.gemspec
# Creates: mycowriter-0.1.1.gem

# Push to RubyGems (requires rubygems.org account)
gem push mycowriter-0.1.1.gem
```

**After publishing:**

1. **Update mrdbid Gemfile:**
   ```ruby
   # Change from local path to rubygems
   gem 'mycowriter', '~> 0.1.1'  # Remove path: '../mycowriter_gem/mycowriter'
   ```

2. **Run bundle update:**
   ```bash
   bundle update mycowriter
   ```

## Summary Checklist

- [ ] Update `_form.html.erb` - replace tokens controller (4 sections)
- [ ] Delete `tokens_controller.js`
- [ ] Update `autocomplete_controller.rb` - remove genera/species methods
- [ ] Update `routes.rb` - remove genera/species autocomplete routes
- [ ] Test genus autocomplete (uppercase validation)
- [ ] Test species autocomplete (genus filtering)
- [ ] Build gem: `gem build mycowriter.gemspec`
- [ ] Push to RubyGems: `gem push mycowriter-0.1.1.gem`
- [ ] Update Gemfile to use published gem
- [ ] Run `bundle update mycowriter`

## Troubleshooting

**If autocomplete doesn't work:**
1. Check browser console for errors
2. Verify routes: `rails routes | grep mycowriter`
3. Verify controller registered: Check `application.js`
4. Restart Rails server

**If validation doesn't trigger:**
1. Check `minlength="4"` on input
2. Verify `data-mycowriter--autocomplete-min-value="4"`
3. Check `config/initializers/mycowriter.rb` settings
