@php use Illuminate\Http\Request; @endphp
<x-layout>
    <div class="container">

        <div class="card mt-5">

            <div class="container">

                <div class="card mt-5">
                    <h3>Upload Image for this specimen:</h3>
                    <div class="card-body">

                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <strong>Whoops!</strong> There were some problems with your input.<br><br>
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        @session('success')
                        <div class="alert alert-success" role="alert">
                            {{ $value }}
                        </div>

                        @php
                            //dd(Session::get('imageName'));
                          $image_name = Session::get('imageName');
                        @endphp

                        <div class="row">
                            <div class="col-md-4">
                                <strong>Original Image:</strong>
                                <br/>
                                <img src="{{ url('storage/uploaded_images/'.$image_name) }}" alt="Full size image"
                                     title="">
                            </div>
                            <div class="col-md-4">
                                <strong>Thumbnail Image:</strong>
                                <br/>

                                <img src="{{ url('storage/uploaded_images/thumbnail/'.$image_name) }}" alt="Thumbnail"
                                     title="">
                            </div>
                        </div>
                        @endsession

                        <form action="{{ route('images_specimen.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <div class="mb-3">
                                <label class="form-label" for="inputImage">Image:</label>
                                <input
                                    type="file"
                                    name="image"
                                    id="inputImage"
                                    class="form-control @error('image') is-invalid @enderror">

                                @error('image')
                                <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>


                            <div class="sm:col-span-4">
                                <label for="parts" class="block text-sm font-medium leading-6 text-gray-900">What part
                                    of
                                    specimen?</label>
                                <div class="mt-2">
                                    <div
                                        class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                        <input
                                            type="text"
                                            name="parts"
                                            id="parts"
                                            class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                            placeholder="What part of specimen?"
                                            value=""
                                            required>
                                    </div>

                                    @error('parts')
                                    <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>


                            <div class="sm:col-span-4">
                                <label for="description"
                                       class="block text-sm font-medium leading-6 text-gray-900">Description</label>
                                <div class="mt-2">
                                    <div
                                        class="flex rounded-md shadow-sm ring-1 ring-inset ring-gray-300 focus-within:ring-2 focus-within:ring-inset focus-within:ring-indigo-600 sm:max-w-md">
                                        <input
                                            type="text"
                                            name="description"
                                            id="description"
                                            class="block flex-1 border-0 bg-transparent py-1.5 px-3 text-gray-900 placeholder:text-gray-400 focus:ring-0 sm:text-sm sm:leading-6"
                                            placeholder="Short description of the image:"
                                            value=""
                                            required>
                                    </div>

                                    @error('description')
                                    <p class="text-xs text-red-500 font-semibold mt-1">{{ $message }}</p>
                                    @enderror
                                </div>
                            </div>


                            <!--  Add the hidden input field to store the specimen_id  -->
                            <input type="hidden" name="specimen_id" value="{{$specimen_id}}">

                            <div class="mb-3">
                                <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Upload</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-layout>
