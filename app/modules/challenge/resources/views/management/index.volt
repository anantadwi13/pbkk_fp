        <!-- Page JS Plugins CSS -->
        <link rel="stylesheet" href="{{ url('/') }}assets/js/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">

            <!-- Main Container -->
            <main id="main-container">
                <div class="px-30">
                    {{ flash.output() }}
                </div>
                <!-- Page Content -->
                <div class="content">
                    <h2 class="content-heading">Challenge Management</h2>

                    <!-- Dynamic Table Full Pagination -->
                    <div class="block">
                        <div class="block-header block-header-default">
                            <h3 class="block-title">Competition</h3>
                                <button type="button" data-toggle="modal" data-target="#modal-create" class="btn btn-hero btn-rounded btn-noborder btn-success">
                                    <i class="fa fa-plus mr-5"></i>Buat
                                </button>
                        </div>
                        <div class="block-content block-content-full">
                            <!-- DataTables functionality is initialized with .js-dataTable-full-pagination class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
                            <table class="table table-bordered table-striped table-vcenter js-dataTable-full-pagination">
                                <thead>
                                    <tr>
                                        <th class="text-center"></th>
                                        <th>Title</th>
                                        <th class="text-center d-none d-sm-table-cell" style="width: 15%;">Due Date</th>
                                        <th class="text-center" style="width: 15%;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">1</td>
                                        <td class="font-w600">Judy Ford Remix</td>
                                        <td class="text-center d-none d-sm-table-cell">
                                            <span class="badge badge-info">30 Agustus 2020</span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#modal-look-1" title="Look">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#modal-edit-1" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#modal-delete-1" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">2</td>
                                        <td class="font-w600">Lisa Jenkins Orchestra</td>
                                        <td class="text-center d-none d-sm-table-cell">
                                            <span class="badge badge-danger">4 Maret 2020</span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#modal-look-1" title="Look">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#modal-edit-1" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#modal-delete-1" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END Dynamic Table Full Pagination -->

                </div>
                <!-- END Page Content -->

                <!-- Create Modal -->
                <div class="modal" id="modal-create" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="block block-themed block-transparent mb-0">
                                <div class="block-header bg-primary-dark">
                                    <h3 class="block-title">Buat Competition</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                            <i class="si si-close"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="block-content">
                                    <form method="post" enctype="multipart/form-data">
                                        <div class="form-group row">
                                            <label class="col-12" for="example-text-input">Title</label>
                                            <div class="col-md-12">
                                                <input type="text" class="form-control" id="title" name="title" placeholder="Judul Challenge">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12" for="example-textarea-input">Description</label>
                                            <div class="col-12">
                                                <textarea class="form-control" id="description" name="description" rows="6" placeholder="Deskripsi Challenge"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12" for="example-text-input">Due Date</label>
                                            <div class="col-lg-6">
                                                <input type="text" class="js-datepicker form-control" id="duedate" name="duedate" data-week-start="1" data-autoclose="true" data-today-highlight="true" data-date-format="dd-mm-yyyy" placeholder="dd-mm-yyyy">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12">Image Poster</label>
                                            <div class="col-6">
                                                <div class="custom-file">
                                                    <!-- Populating custom file input label with the selected filename (data-toggle="custom-file-input" is initialized in Helpers.coreBootstrapCustomFileInput()) -->
                                                    <input type="file" class="custom-file-input" id="image" name="image" data-toggle="custom-file-input">
                                                    <label class="custom-file-label" for="example-file-input-custom">Pilih gambar poster 4:3</label>
                                                    <div class="form-text text-muted">Poster yang mewakili challenge di dengar.in</div>
                                                </div>
                                            </div>
                                        </div>
                                    {#</form>#}
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Batal</button>
                                {#<form method="post">#}
                                    <button type="submit" class="btn btn-alt-success">
                                        <i class="fa fa-check"></i> Buat
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Create Modal -->

                <!-- Look Modal -->
                <div class="modal" id="modal-look-1" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="block block-themed block-transparent mb-0">
                                <div class="block-header bg-primary-dark">
                                    <h3 class="block-title">Lihat</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                            <i class="si si-close"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="block-content">
                                    <div class="form-group row">
                                        <label class="col-12" for="example-text-input">Title</label>
                                        <div class="col-md-12">
                                            <div class="form-control-plaintext">Judul Challenge</div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-12" for="example-textarea-input">Description</label>
                                        <div class="col-12">
                                            <div class="form-control-plaintext">Deskripsi Challenge</div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-12" for="example-text-input">Due Date</label>
                                        <div class="col-lg-6">
                                            <div class="form-control-plaintext">dd-mm-yyyy</div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-12">Image Poster</label>
                                        <div class="col-md-3"></div>
                                        <div class="col-md-6 animated fadeIn">
                                            <div class="options-container fx-item-zoom-in fx-overlay-zoom-out">
                                                <img class="img-fluid options-item" src="assets/media/photos/photo10@2x.jpg" alt="">
                                            </div>
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Tutup</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Look Modal -->
                <!-- Edit Modal -->
                <div class="modal" id="modal-edit-1" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="block block-themed block-transparent mb-0">
                                <div class="block-header bg-primary-dark">
                                    <h3 class="block-title">Edit</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                            <i class="si si-close"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="block-content">
                                    <form action="be_forms_elements_bootstrap.html" method="post" enctype="multipart/form-data" onsubmit="return false;">
                                        <div class="form-group row">
                                            <label class="col-12" for="example-text-input">Title</label>
                                            <div class="col-md-12">
                                                <input type="text" class="form-control" id="example-text-input" name="example-text-input" value="Judul Challenge">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12" for="example-textarea-input">Description</label>
                                            <div class="col-12">
                                                <textarea class="form-control" id="example-textarea-input" name="example-textarea-input" rows="6">Deskripsi Challenge</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12" for="example-text-input">Due Date</label>
                                            <div class="col-lg-6">
                                                <input type="text" class="js-datepicker form-control" id="example-datepicker3" name="example-datepicker3" data-week-start="1" data-autoclose="true" data-today-highlight="true" data-date-format="dd-mm-yyyy" value="dd-mm-yyyy">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12">Image Poster</label>
                                            <div class="col-6">
                                                <div class="custom-file">
                                                    <!-- Populating custom file input label with the selected filename (data-toggle="custom-file-input" is initialized in Helpers.coreBootstrapCustomFileInput()) -->
                                                    <input type="file" class="custom-file-input" id="example-file-input-custom" name="example-file-input-custom" data-toggle="custom-file-input" value="abc.jpg">
                                                    <label class="custom-file-label" for="example-file-input-custom">gambar.jpg</label>
                                                    <div class="form-text text-muted">Poster yang mewakili challenge di dengar.in</div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Batal</button>
                                <form method="post">
                                    <button type="submit" class="btn btn-alt-success" data-dismiss="modal">
                                        <i class="fa fa-check"></i> Buat
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Edit Modal -->
                <!-- Delete Modal -->
                <div class="modal" id="modal-delete-1" tabindex="-1" role="dialog" aria-labelledby="modal-small" aria-hidden="true">
                    <div class="modal-dialog modal-sm" role="document">
                        <div class="modal-content">
                            <div class="block block-themed block-transparent mb-0">
                                <div class="block-header bg-primary-dark">
                                    <h3 class="block-title">Hapus</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                            <i class="si si-close"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="block-content">
                                    <p>Apakah Anda yakin ingin menghapus challenge ini?</p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Tidak</button>
                                <button type="button" class="btn btn-alt-danger" data-dismiss="modal">
                                    <i class="fa fa-check"></i> Iya
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Delete Modal -->

            </main>
            <!-- END Main Container -->

        <!-- Page JS Plugins -->
        <script src="{{ url('/') }}assets/js/core/jquery.min.js"></script>

        <script src="{{ url('/') }}assets/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

        <script src="{{ url('/') }}assets/js/pages/be_forms_plugins.min.js"></script>

        {#<script>jQuery(function(){ Codebase.helpers(['datepicker']); });</script>#}