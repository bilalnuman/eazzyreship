<x-app-layout>
    @section('title', 'Shipments Attachments')

    @section('content_header')
        <h1>Shipments Attachments</h1>
    @endsection

    @section('content')
        <div class="container-fluid">
            <div class="row g-3">
                @forelse($data as $att)
                    @php
                        $url  = $att['url'] ?? $att->url;
                        $name = $att['original_name'] ?? $att->original_name ?? basename($att['path'] ?? $att->path ?? $url);
                        $path = $att['path'] ?? $att->path ?? $url;

                        $ext = strtolower(pathinfo(parse_url($path, PHP_URL_PATH), PATHINFO_EXTENSION));
                        $isPdf = $ext === 'pdf';
                        $isImage = in_array($ext, ['jpg','jpeg','png']);
                    @endphp

                    <div class="col-6 col-md-3">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body text-center">

                                {{-- PDF: open in new tab --}}
                                @if($isPdf)
                                    <a href="{{ $url }}" target="_blank" class="btn btn-danger w-100">
                                        <i class="fas fa-file-pdf"></i> Open PDF
                                    </a>
                                {{-- Image: thumbnail -> fullscreen modal --}}
                                @elseif($isImage)
                                    <img
                                        src="{{ $url }}"
                                        alt="{{ $name }}"
                                        class="img-fluid rounded"
                                        style="height:120px; object-fit:cover; cursor:pointer;"
                                        data-bs-toggle="modal"
                                        data-bs-target="#imagePreviewModal"
                                        data-image-url="{{ $url }}"
                                        data-image-name="{{ $name }}"
                                    />

                                {{-- Other file: download/open in new tab --}}
                                @else
                                    <a href="{{ $url }}" target="_blank" class="btn btn-secondary w-100">
                                        <i class="fas fa-paperclip"></i> Download
                                    </a>
                                    <div class="small text-muted mt-2 text-truncate" title="{{ $name }}">
                                        {{ $name }}
                                    </div>
                                @endif

                            </div>
                        </div>
                    </div>

                @empty
                    <div class="col-12">
                        <div class="alert alert-info">No attachments found.</div>
                    </div>
                @endforelse
            </div>
        </div>

        {{-- FULLSCREEN Image Preview Modal --}}
        <div class="modal fade" id="imagePreviewModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content bg-dark text-white">
                    <div class="modal-header border-0">
                        <h5 class="modal-title" id="previewTitle">Preview</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body d-flex align-items-center justify-content-center">
                        <img
                            id="previewImage"
                            src=""
                            alt=""
                            style="max-width: 100%; max-height: 90vh;"
                            class="rounded"
                        />
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const modalEl = document.getElementById('imagePreviewModal');
                const img = document.getElementById('previewImage');
                const title = document.getElementById('previewTitle');

                modalEl.addEventListener('show.bs.modal', function (event) {
                    const trigger = event.relatedTarget;
                    const url = trigger.getAttribute('data-image-url');
                    const name = trigger.getAttribute('data-image-name');

                    img.src = url;
                    img.alt = name || 'Preview';
                    title.textContent = name || 'Preview';
                });

                modalEl.addEventListener('hidden.bs.modal', function () {
                    img.src = '';
                    img.alt = '';
                    title.textContent = 'Preview';
                });

                // Optional: click image to close
                img.addEventListener('click', function () {
                    const instance = bootstrap.Modal.getInstance(modalEl);
                    if (instance) instance.hide();
                });
            });
        </script>
    @endsection
</x-app-layout>
