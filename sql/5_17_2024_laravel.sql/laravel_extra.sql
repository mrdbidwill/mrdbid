
--
-- Indexes for dumped tables
--

--
-- Indexes for table `abundances`
--
ALTER TABLE `abundances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `annulus_positions`
--
ALTER TABLE `annulus_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulb_types`
--
ALTER TABLE `bulb_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cap_context_flesh_textures`
--
ALTER TABLE `cap_context_flesh_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_margin_shapes`
--
ALTER TABLE `cap_margin_shapes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_margin_types`
--
ALTER TABLE `cap_margin_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_shapes`
--
ALTER TABLE `cap_shapes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_shape_top_views`
--
ALTER TABLE `cap_shape_top_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_surface_dryness`
--
ALTER TABLE `cap_surface_dryness`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cap_surface_textures`
--
ALTER TABLE `cap_surface_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chem_reactions`
--
ALTER TABLE `chem_reactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_sources`
--
ALTER TABLE `data_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_source_data_types`
--
ALTER TABLE `data_source_data_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `display_options`
--
ALTER TABLE `display_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `epithets`
--
ALTER TABLE `epithets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fungus_types`
--
ALTER TABLE `fungus_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genus`
--
ALTER TABLE `genus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_attachments`
--
ALTER TABLE `gill_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_breadths`
--
ALTER TABLE `gill_breadths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_context_flesh_latex_abundances`
--
ALTER TABLE `gill_context_flesh_latex_abundances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_edges`
--
ALTER TABLE `gill_edges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_miscs`
--
ALTER TABLE `gill_miscs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_spacings`
--
ALTER TABLE `gill_spacings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gill_thickness`
--
ALTER TABLE `gill_thickness`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `habitats`
--
ALTER TABLE `habitats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `habits`
--
ALTER TABLE `habits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images_thumbnails`
--
ALTER TABLE `images_thumbnails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lens`
--
ALTER TABLE `lens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_list_clusters`
--
ALTER TABLE `member_list_clusters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_list_groups`
--
ALTER TABLE `member_list_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member_types`
--
ALTER TABLE `member_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `odors`
--
ALTER TABLE `odors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partial_inner_veil_appearances`
--
ALTER TABLE `partial_inner_veil_appearances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partial_inner_veil_fates`
--
ALTER TABLE `partial_inner_veil_fates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partial_inner_veil_textures`
--
ALTER TABLE `partial_inner_veil_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partial_inter_veil_annulus_ring_positions`
--
ALTER TABLE `partial_inter_veil_annulus_ring_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plants`
--
ALTER TABLE `plants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plant_associations`
--
ALTER TABLE `plant_associations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `possible_matches`
--
ALTER TABLE `possible_matches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preservation_methods`
--
ALTER TABLE `preservation_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `soil_types`
--
ALTER TABLE `soil_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimens`
--
ALTER TABLE `specimens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimen_ages`
--
ALTER TABLE `specimen_ages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimen_characters`
--
ALTER TABLE `specimen_characters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimen_clusters`
--
ALTER TABLE `specimen_clusters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimen_groups`
--
ALTER TABLE `specimen_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specimen_locations_now`
--
ALTER TABLE `specimen_locations_now`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stem_interiors`
--
ALTER TABLE `stem_interiors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stem_locations`
--
ALTER TABLE `stem_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stem_shapes`
--
ALTER TABLE `stem_shapes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stem_surfaces`
--
ALTER TABLE `stem_surfaces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stem_textures`
--
ALTER TABLE `stem_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `synonyms`
--
ALTER TABLE `synonyms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tastes`
--
ALTER TABLE `tastes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `toxics`
--
ALTER TABLE `toxics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universal_outer_veil_appearances`
--
ALTER TABLE `universal_outer_veil_appearances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universal_outer_veil_fates`
--
ALTER TABLE `universal_outer_veil_fates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `universal_outer_veil_textures`
--
ALTER TABLE `universal_outer_veil_textures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `veils`
--
ALTER TABLE `veils`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abundances`
--
ALTER TABLE `abundances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `annulus_positions`
--
ALTER TABLE `annulus_positions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bulb_types`
--
ALTER TABLE `bulb_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cap_context_flesh_textures`
--
ALTER TABLE `cap_context_flesh_textures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cap_margin_shapes`
--
ALTER TABLE `cap_margin_shapes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cap_margin_types`
--
ALTER TABLE `cap_margin_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cap_shapes`
--
ALTER TABLE `cap_shapes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cap_shape_top_views`
--
ALTER TABLE `cap_shape_top_views`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cap_surface_dryness`
--
ALTER TABLE `cap_surface_dryness`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cap_surface_textures`
--
ALTER TABLE `cap_surface_textures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `chem_reactions`
--
ALTER TABLE `chem_reactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_sources`
--
ALTER TABLE `data_sources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `data_source_data_types`
--
ALTER TABLE `data_source_data_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `display_options`
--
ALTER TABLE `display_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `epithets`
--
ALTER TABLE `epithets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fungus_types`
--
ALTER TABLE `fungus_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `genus`
--
ALTER TABLE `genus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `gill_attachments`
--
ALTER TABLE `gill_attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `gill_breadths`
--
ALTER TABLE `gill_breadths`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gill_context_flesh_latex_abundances`
--
ALTER TABLE `gill_context_flesh_latex_abundances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gill_edges`
--
ALTER TABLE `gill_edges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `gill_miscs`
--
ALTER TABLE `gill_miscs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `gill_spacings`
--
ALTER TABLE `gill_spacings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gill_thickness`
--
ALTER TABLE `gill_thickness`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `habitats`
--
ALTER TABLE `habitats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `habits`
--
ALTER TABLE `habits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images_thumbnails`
--
ALTER TABLE `images_thumbnails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lens`
--
ALTER TABLE `lens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member_list_clusters`
--
ALTER TABLE `member_list_clusters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `member_list_groups`
--
ALTER TABLE `member_list_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `member_types`
--
ALTER TABLE `member_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `odors`
--
ALTER TABLE `odors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `partial_inner_veil_appearances`
--
ALTER TABLE `partial_inner_veil_appearances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `partial_inner_veil_fates`
--
ALTER TABLE `partial_inner_veil_fates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `partial_inner_veil_textures`
--
ALTER TABLE `partial_inner_veil_textures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `partial_inter_veil_annulus_ring_positions`
--
ALTER TABLE `partial_inter_veil_annulus_ring_positions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plants`
--
ALTER TABLE `plants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plant_associations`
--
ALTER TABLE `plant_associations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `possible_matches`
--
ALTER TABLE `possible_matches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `preservation_methods`
--
ALTER TABLE `preservation_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `soil_types`
--
ALTER TABLE `soil_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `species`
--
ALTER TABLE `species`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `specimens`
--
ALTER TABLE `specimens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specimen_ages`
--
ALTER TABLE `specimen_ages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `specimen_characters`
--
ALTER TABLE `specimen_characters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specimen_clusters`
--
ALTER TABLE `specimen_clusters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specimen_groups`
--
ALTER TABLE `specimen_groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `specimen_locations_now`
--
ALTER TABLE `specimen_locations_now`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `stem_interiors`
--
ALTER TABLE `stem_interiors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stem_locations`
--
ALTER TABLE `stem_locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stem_shapes`
--
ALTER TABLE `stem_shapes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `stem_surfaces`
--
ALTER TABLE `stem_surfaces`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `stem_textures`
--
ALTER TABLE `stem_textures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `synonyms`
--
ALTER TABLE `synonyms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tastes`
--
ALTER TABLE `tastes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `toxics`
--
ALTER TABLE `toxics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `universal_outer_veil_appearances`
--
ALTER TABLE `universal_outer_veil_appearances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `universal_outer_veil_fates`
--
ALTER TABLE `universal_outer_veil_fates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `universal_outer_veil_textures`
--
ALTER TABLE `universal_outer_veil_textures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `veils`
--
ALTER TABLE `veils`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
