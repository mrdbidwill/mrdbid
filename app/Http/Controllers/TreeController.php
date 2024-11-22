<?php

namespace App\Http\Controllers;

use App\Models\Tree;

class TreeController extends Controller
{
    public function index()
    {
        $trees = Tree::latest()->simplePaginate(3);

        return view('trees.index', [
            'trees' => $trees,
        ]);
    }

    public function show(Tree $Tree)
    {
        return view('trees.show', ['Tree' => $Tree]);
    }

    public function store()
    {
        request()->validate([
            'name' => ['required', 'min:3'],
            'display_options' => ['required'],
            'look_up_y_n' => ['required'],
            'part' => ['required'],
            'source' => ['required'],
            'entered_by' => ['required'],
        ]);

        Tree::create([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'part' => request('part'),
            'source' => request('Tree_location_now'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/trees');
    }

    public function create()
    {
        return view('trees.create');
    }

    public function edit(Tree $Tree)
    {
        return view('trees.edit', ['Tree' => $Tree]);

    }

    public function update(Tree $tree)
    {
        // authorize (On hold...)

        request()->validate([
            'name' => ['required', 'min:3'],
            'display_options' => ['required'],
            'look_up_y_n' => 'required',
            'part' => 'required',
            'source' => 'required',
            'entered_by' => 'required',
        ]);

        $tree->update([
            'name' => request('name'),
            'display_options' => request('display_options'),
            'look_up_y_n' => request('look_up_y_n'),
            'part' => request('part'),
            'source' => request('source'),
            'entered_by' => request('entered_by'),

        ]);

        return redirect('/trees/'.$tree->id);
    }

    public function destroy(Tree $tree)
    {
        // authorize (On hold...)

        $tree->delete();

        return redirect('/trees');
    }
}
