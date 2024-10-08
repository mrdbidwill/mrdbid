<x-layout>
    <x-admin-dashboard-nav-bar></x-admin-dashboard-nav-bar>

    @if (Session::has('message'))
        <div class="text-3xl text-red-700">{{ Session::get('message') }}</div>
    @endif
    <p>(resources/views/admin/admin_lookup/index.blade.php)</p>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">Select Lookup Table</div>

                    <div class="card-body">


                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Select the Lookup Table you need to edit:</th>

                            </tr>
                            </thead>
                            <tbody>
                            @php
                                //dd($lookup_lists);
                                //dd($lookup_lists->id);
                             // @endphp
                            @foreach ($lookup_lists as $lookup_list)
                                @php
                                    //dd($lookup_list);
                                    //dd($lookup_list['id']);
                                 // @endphp
                                <tr>
                                    <td>
                                        <form method="GET" action="/admin_lookup/{{ $lookup_list['id'] }}/edit">

                                            @php //dd($lookup_list); @endphp
                                            <input type="radio" id="id" name="id" checked
                                                   value="{{ $lookup_list['id'] }}" required> <label
                                                for="{{ $lookup_list['id'] }}">{{ $lookup_list['name'] }}
                                            </label>
                                            <x-button type="submit">Edit</x-button>

                                            @error('id')
                                            <div class="alert alert-danger mt-3">
                                                {{ $message }}
                                            </div>
                                            @enderror
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-layout>
