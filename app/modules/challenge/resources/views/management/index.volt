        <!-- Page JS Plugins CSS -->
        <link rel="stylesheet" href="{{ url('/') }}assets/js/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">

            <!-- Main Container -->
            <main id="main-container">
                <div class="px-30">
                    {{ flashSession.output() }}
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
                                    {% if competition|length == 0 %}
                                        <tr>
                                            <td class="text-center" colspan="4">-</td>
                                        </tr>
                                    {% endif %}
                                    {% for c in competition %}
                                    <tr>
                                        <td class="text-center">{{ loop.index }}</td>
                                        <td class="font-w600">{{ c.title }}</td>
                                        <td class="text-center d-none d-sm-table-cell">
                                            {% if expired[loop.index -1] %}
                                            <span class="badge badge-danger">{{ readable_date[loop.index -1] }}</span>
                                            {% else %}
                                            <span class="badge badge-info">{{ readable_date[loop.index -1] }}</span>
                                            {% endif %}
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#modal-look-{{ loop.index }}" title="Look">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#modal-edit-{{ loop.index }}" title="Edit">
                                                    <i class="fa fa-pencil"></i>
                                                </button>
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#modal-delete-{{ loop.index }}" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                <!-- Look Modal -->
                <div class="modal" id="modal-look-{{ loop.index }}" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true">
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
                                            <div class="form-control-plaintext">{{ c.title }}</div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-12" for="example-textarea-input">Description</label>
                                        <div class="col-12">
                                            <div class="form-control-plaintext">{{ c.description }}</div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-12" for="example-text-input">Due Date</label>
                                        <div class="col-lg-6">
                                            <div class="form-control-plaintext">{{ readable_date[loop.index -1] }}</div>
                                            <div class="form-text text-muted">Secara default pada 00:00:00</div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-12">Image Poster</label>
                                        <div class="col-md-3"></div>
                                        <div class="col-md-6 animated fadeIn">
                                            <div class="options-container fx-item-zoom-in fx-overlay-zoom-out">
                                                <img class="img-fluid options-item" src="{{url("/")}}challenge_competition/{{ c.image }}" alt="">
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
                <div class="modal" id="modal-edit-{{ loop.index }}" tabindex="-1" role="dialog" aria-labelledby="modal-large" aria-hidden="true">
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
                                    <form method="post" enctype="multipart/form-data">
                                        <div class="form-group row">
                                            <label class="col-12" for="example-text-input">Title</label>
                                            <div class="col-md-12">
                                                <input type="text" class="form-control" id="title" name="title" value="{{ c.title }}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12" for="example-textarea-input">Description</label>
                                            <div class="col-12">
                                                <textarea class="form-control" id="description" name="description" rows="6">{{ c.description }}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12" for="example-text-input">Due Date</label>
                                            <div class="col-lg-6">
                                                <input type="date" class="js-datepicker form-control" id="duedate" name="duedate" data-week-start="1" data-autoclose="true" data-today-highlight="true" data-date-format="dd-mm-yyyy" value="{{ c.duedate }}">
                                                <div class="form-text text-muted">Secara default pada 00:00:00</div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12">Image Poster</label>
                                            <div class="col-md-3"></div>
                                            <div class="col-md-6 animated fadeIn">
                                                <div class="options-container fx-item-zoom-in fx-overlay-zoom-out">
                                                    <img class="img-fluid options-item" src="{{url("/")}}challenge_competition/{{ c.image }}" alt="">
                                                </div>
                                            </div>
                                            <div class="col-md-3"></div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-6">
                                                <div class="custom-file">
                                                    <!-- Populating custom file input label with the selected filename (data-toggle="custom-file-input" is initialized in Helpers.coreBootstrapCustomFileInput()) -->
                                                    <input type="file" class="custom-file-input" id="image" name="image" data-toggle="custom-file-input">
                                                    <label class="custom-file-label" for="image">Gambarmu.jpg</label>
                                                    <div class="form-text text-muted">Poster landscape yang mewakili challenge di dengar.in maks 2MB</div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Batal</button>
                                    <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                                    <input type="hidden" name="id" value="{{ c.idcomp }}">
                                    <button type="submit" id="edit" name="edit" value="edit" class="btn btn-alt-success">
                                        <i class="fa fa-check"></i> Simpan
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Edit Modal -->
                <!-- Delete Modal -->
                <div class="modal" id="modal-delete-{{ loop.index }}" tabindex="-1" role="dialog" aria-labelledby="modal-small" aria-hidden="true">
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
                                <form method="post">
                                <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                                <input type="hidden" name="id" value="{{ c.idcomp }}">
                                <button type="submit" id="delete" name="delete" value="delete" class="btn btn-alt-danger">
                                    <i class="fa fa-check"></i> Iya
                                </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Delete Modal -->
                                    {% endfor %}
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END Dynamic Table Full Pagination -->

                </div>
                <!-- END Page Content -->

            </main>
            <!-- END Main Container -->

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
                                                <input type="date" class="js-datepicker form-control" id="duedate" name="duedate" data-week-start="1" data-autoclose="true" data-today-highlight="true" data-date-format="dd-mm-yyyy" placeholder="dd-mm-yyyy">
                                                <div class="form-text text-muted">Secara default pada 00:00:00</div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-12">Image Poster</label>
                                            <div class="col-6">
                                                <div class="custom-file">
                                                    <!-- Populating custom file input label with the selected filename (data-toggle="custom-file-input" is initialized in Helpers.coreBootstrapCustomFileInput()) -->
                                                    <input type="file" class="custom-file-input" id="image" name="image" data-toggle="custom-file-input">
                                                    <label class="custom-file-label" for="image">Pilih gambar poster landscape 4:3</label>
                                                    <div class="form-text text-muted">Poster landscape yang mewakili challenge di dengar.in maks 2MB</div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Batal</button>
                                    <button type="submit" id="create" name="create" value="create" class="btn btn-alt-success">
                                        <i class="fa fa-check"></i> Buat
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Create Modal -->

        <!-- Page JS Plugins -->
        <script src="{{ url('/') }}assets/js/core/jquery.min.js"></script>

        <script src="{{ url('/') }}assets/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

        <script src="{{ url('/') }}assets/js/pages/be_forms_plugins.min.js"></script>

        {#<script>jQuery(function(){ Codebase.helpers(['datepicker']); });</script>#}