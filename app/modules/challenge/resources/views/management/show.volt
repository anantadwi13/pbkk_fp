        <!-- Page JS Plugins CSS -->
        <link rel="stylesheet" href="{{ url('/') }}assets/js/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css">

            <!-- Main Container -->
            <main id="main-container">
                <div class="px-30">
                    {{ flashSession.output() }}
                </div>
                <!-- Page Content -->
                <div class="content">
                    <h2 class="content-heading">Submission Management</h2>

                    <!-- Dynamic Table Full Pagination -->
                    <div class="block">
                        <div class="block-header block-header-default">
                            <h3 class="block-title"><small>Competition: </small><strong>{{competition_name}}</strong></h3>
                        </div>
                        <div class="block-content block-content-full">
                            <!-- DataTables functionality is initialized with .js-dataTable-full-pagination class in js/pages/be_tables_datatables.min.js which was auto compiled from _es6/pages/be_tables_datatables.js -->
                            <table class="table table-bordered table-striped table-vcenter js-dataTable-full-pagination">
                                <thead>
                                    <tr>
                                        <th class="text-center"></th>
                                        <th>Filename</th>
                                        <th class="text-center d-none d-sm-table-cell" style="width: 15%;">Username</th>
                                        <th class="text-center" style="width: 15%;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {% if submission|length == 0 %}
                                        <tr>
                                            <td class="text-center" colspan="4">-</td>
                                        </tr>
                                    {% endif %}
                                    {% for s in submission %}
                                    <tr>
                                        <td class="text-center">{{ loop.index }}</td>
                                        <td class="font-w600">{{ s.files }}</td>
                                        <td class="font-w600">{{ username[loop.index -1] }}</td>
                                        <td class="text-center">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#modal-delete-{{ loop.index }}" title="Delete">
                                                    <i class="fa fa-times"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
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
                                    <p>Apakah Anda yakin ingin menghapus submission ini?</p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Tidak</button>
                                <form method="post">
                                <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                                <input type="hidden" name="id" value="{{ s.id }}">
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

        <!-- Page JS Plugins -->
        <script src="{{ url('/') }}assets/js/core/jquery.min.js"></script>

        <script src="{{ url('/') }}assets/js/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

        <script src="{{ url('/') }}assets/js/pages/be_forms_plugins.min.js"></script>

        {#<script>jQuery(function(){ Codebase.helpers(['datepicker']); });</script>#}