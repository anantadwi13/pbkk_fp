            <!-- Main Container -->
            <main id="main-container">

                <!-- Hero -->
                <div class="bg-image" style="background-image: url('{{url("/")}}challenge_competition/{{competition.image}}');">
                    <div class="bg-black-op-75">
                        <div class="content content-top text-center">
                            <div class="py-100">
                                <h1 class="font-w700 text-white mb-10">{{competition.title}}</h1>
                                <h2 class="h4 font-w400 text-white-op">{{readable_date}}</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Hero -->

                <!-- Story -->
                <div class="content content-full nice-copy-story">
                    <div class="row justify-content-center py-30">
                        <div class="col-lg-8">
                            <h3>Informasi</h3>
                            <p>{{competition.description}}</p>

                            <!-- Simple Gallery (.js-gallery class is initialized in Helpers.magnific()) -->
                            <!-- For more info and examples you can check out http://dimsemenov.com/plugins/magnific-popup/ -->
                            <div class="row no-gutters push js-gallery img-fluid-100">
                                <div class="col-12 animated fadeIn">
                                    <img class="img-fluid" src="{{url('/')}}challenge_competition/{{competition.image}}" alt="">
                                </div>
                            </div>
                            <!-- END Simple Gallery -->

                        </div>
                    </div>
                </div>
                <!-- END Story -->
                {% if !expired %}
                <!-- Responses -->
                <div class="bg-body-dark">
                    <div class="content content-full">
                        <div class="row justify-content-center py-30">
                            <div class="col-lg-8">
                                <h3 class="font-w700 mb-50">Your Submission</h3>
                                    {% if true %}
                                    <div class="media mb-30 btn-group">
                                    <!-- If it doesn't have any submission, then create one -->
                                        <button type="button" data-toggle="modal" data-target="#modal-create" class="btn btn-rounded btn-noborder btn-outline-success min-width-125" title="Create">
                                            <i class="fa fa-plus mr-5"></i>Unggah
                                        </button>
                                    </div>
                                    <!-- Create Modal -->
                                    <div class="modal" id="modal-create" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="block block-themed block-transparent mb-0">
                                                    <div class="block-header bg-primary-dark">
                                                        <h3 class="block-title">Unggah File Submission</h3>
                                                        <div class="block-options">
                                                            <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                                                <i class="si si-close"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="block-content">
                                                        <form method="post" enctype="multipart/form-data">
                                                            <div class="form-group row">
                                                                <label class="col-12">Filemu</label>
                                                                <div class="col-12">
                                                                    <div class="custom-file">
                                                                        <!-- Populating custom file input label with the selected filename (data-toggle="custom-file-input" is initialized in Helpers.coreBootstrapCustomFileInput()) -->
                                                                        <input type="file" class="custom-file-input" id="image" name="image" data-toggle="custom-file-input">
                                                                        <label class="custom-file-label" for="image">submission.zip</label>
                                                                        <div class="form-text text-muted">File dikompress menjadi zip dan maksimal berukuran 20MB</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Batal</button>
                                                    <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                                                    <input type="hidden" name="idcomp" value="{{ competition.idcomp }}">
                                                    <input type="hidden" name="id" value="{{ iduser }}">
                                                    <button type="submit" id="create" name="create" value="create" class="btn btn-alt-success">
                                                        <i class="fa fa-check"></i> Unggah
                                                    </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END Create Modal -->   
                                    {% else %}
                                    <!-- otherwise show, edit or delete -->
                                    <div class="media mb-30 btn-group">
                                        <button type="button" disabled class="btn btn-rounded btn-noborder btn-outline-secondary min-width-300">
                                            {{"file.zip"}}
                                        </button>
                                        <button type="button" class="btn btn-rounded btn-noborder btn-outline-info min-width-125" data-toggle="modal" data-target="#modal-edit" title="Edit">
                                            <i class="fa fa-pencil mr-5"></i>Ganti
                                        </button>
                                        <button type="button" class="btn btn-rounded btn-noborder btn-outline-danger min-width-125" data-toggle="modal" data-target="#modal-delete" title="Delete">
                                            <i class="fa fa-times mr-5"></i>Hapus
                                        </button>                                    
                                    </div>
                                    <!-- Edit Modal -->
                                    <div class="modal" id="modal-edit" tabindex="-1" role="dialog" aria-labelledby="modal-normal" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="block block-themed block-transparent mb-0">
                                                    <div class="block-header bg-primary-dark">
                                                        <h3 class="block-title">Unggah File Baru Submission</h3>
                                                        <div class="block-options">
                                                            <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                                                <i class="si si-close"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="block-content">
                                                        <form method="post" enctype="multipart/form-data">
                                                            <div class="form-group row">
                                                                <label class="col-12">File Barumu</label>
                                                                <div class="col-12">
                                                                    <div class="custom-file">
                                                                        <!-- Populating custom file input label with the selected filename (data-toggle="custom-file-input" is initialized in Helpers.coreBootstrapCustomFileInput()) -->
                                                                        <input type="file" class="custom-file-input" id="image" name="image" data-toggle="custom-file-input">
                                                                        <label class="custom-file-label" for="image">{{"file.zip"}}</label>
                                                                        <div class="form-text text-muted">File dikompress menjadi zip dan maksimal berukuran 20MB</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Batal</button>
                                                    <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                                                    <input type="hidden" name="idcomp" value="{{ competition.idcomp }}">
                                                    <input type="hidden" name="id" value="{{ iduser }}">
                                                    <button type="submit" id="edit" name="edit" value="edit" class="btn btn-alt-success">
                                                        <i class="fa fa-check"></i> Simpan Perubahan
                                                    </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END Edit Modal -->  
                                    <!-- Delete Modal -->
                                    <div class="modal" id="modal-delete" tabindex="-1" role="dialog" aria-labelledby="modal-small" aria-hidden="true">
                                        <div class="modal-dialog modal-sm" role="document">
                                            <div class="modal-content">
                                                <div class="block block-themed block-transparent mb-0">
                                                    <div class="block-header bg-primary-dark">
                                                        <h3 class="block-title">Batalkan File Submission</h3>
                                                        <div class="block-options">
                                                            <button type="button" class="btn-block-option" data-dismiss="modal" aria-label="Close">
                                                                <i class="si si-close"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="block-content">
                                                        <p>Apakah Anda yakin ingin menghapus submission untuk challenge ini?</p>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-alt-secondary" data-dismiss="modal">Tidak</button>
                                                    <form method="post">
                                                    <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                                                    <input type="hidden" name="id" value="{{ competition.idcomp }}">
                                                    <input type="hidden" name="id" value="{{ iduser }}">
                                                    <button type="submit" id="delete" name="delete" value="delete" class="btn btn-alt-danger">
                                                        <i class="fa fa-check"></i> Iya
                                                    </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END Delete Modal -->                                                                  
                                    {% endif %}
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Responses -->
                {% endif %}
            </main>
            <!-- END Main Container -->