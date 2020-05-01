            <!-- Main Container -->
            <main id="main-container">

                <!-- Page Content -->
                <!-- User Info -->
                <div class="bg-image bg-image-bottom" style="background-image: url('{{ url('/') }}assets/media/photos/photo44.jpg');">
                    <div class="bg-primary-dark-op py-30">
                        <div class="content content-full text-center">
                            <!-- Avatar -->
                            <div class="mb-15">
                                <i class="fa fa-music fa-4x text-warning-light"></i>
                            </div>
                            <!-- END Avatar -->

                            <!-- Personal -->
                            <h1 class="h3 text-white font-w700 mb-10">{{ user.name }}</h1>
                            <h2 class="h5 text-white-op">
                                {% if user.data is defined %}{{ user.data.bio }}{% endif %}
                            </h2>
{#                            <h2 class="h5 text-white-op">#}
{#                                Poin Dengar: <p class="text-primary-light">100</p>#}
{#                            </h2>#}
                            <!-- END Personal -->

                            <!-- Actions -->
                            {% if not followed %}
                            <form action="{{ url({'for': 'main-user-follow', 'username': user.username}) }}" method="post" style="display: inline-block">
                                <button type="submit" class="btn btn-rounded btn-hero btn-sm btn-alt-success mb-5">
                                    <i class="fa fa-plus mr-5"></i> Follow
                                </button>
                            </form>
                            {% else %}
                            <form action="{{ url({'for': 'main-user-unfollow', 'username': user.username}) }}" method="post" style="display: inline-block">
                                <button type="submit" class="btn btn-rounded btn-hero btn-sm btn-alt-danger mb-5">
                                    <i class="fa fa-minus mr-5"></i> Unfollow
                                </button>
                            </form>
                            {% endif %}
{#                            <button type="button" class="btn btn-rounded btn-hero btn-sm btn-alt-danger mb-5">#}
{#                                <i class="fa fa-times mr-5"></i> Block#}
{#                            </button>#}
                            <!-- END Actions -->
                        </div>
                    </div>
                </div>
                <!-- END User Info -->

                <!-- Main Content -->
                <div class="content">

                    {{ flashSession.output() }}

                    <!-- Simple Gallery (.js-gallery class is initialized in Helpers.magnific()) -->
                    <!-- For more info and examples you can check out http://dimsemenov.com/plugins/magnific-popup/ -->
                    <h2 class="content-heading">Gallery</h2>
                    <div class="row items-push js-gallery img-fluid-100">
                        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn">
                            <a class="img-link img-link-zoom-in img-thumb img-lightbox" target="_blank" href="{{ url('/') }}assets/media/photos/photo17@2x.jpg">
                                <img class="img-fluid" src="{{ url('/') }}assets/media/photos/photo17.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn">
                            <a class="img-link img-link-zoom-in img-thumb img-lightbox" target="_blank" href="{{ url('/') }}assets/media/photos/photo18@2x.jpg">
                                <img class="img-fluid" src="{{ url('/') }}assets/media/photos/photo18.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn">
                            <a class="img-link img-link-zoom-in img-thumb img-lightbox" target="_blank" href="{{ url('/') }}assets/media/photos/photo19@2x.jpg">
                                <img class="img-fluid" src="{{ url('/') }}assets/media/photos/photo19.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn">
                            <a class="img-link img-link-zoom-in img-thumb img-lightbox" target="_blank" href="{{ url('/') }}assets/media/photos/photo20@2x.jpg">
                                <img class="img-fluid" src="{{ url('/') }}assets/media/photos/photo20.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn">
                            <a class="img-link img-link-zoom-in img-thumb img-lightbox" target="_blank" href="{{ url('/') }}assets/media/photos/photo21@2x.jpg">
                                <img class="img-fluid" src="{{ url('/') }}assets/media/photos/photo21.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn">
                            <a class="img-link img-link-zoom-in img-thumb img-lightbox" target="_blank" href="{{ url('/') }}assets/media/photos/photo22@2x.jpg">
                                <img class="img-fluid" src="{{ url('/') }}assets/media/photos/photo22.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn">
                            <a class="img-link img-link-zoom-in img-thumb img-lightbox" target="_blank" href="{{ url('/') }}assets/media/photos/photo23@2x.jpg">
                                <img class="img-fluid" src="{{ url('/') }}assets/media/photos/photo23.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn">
                            <a class="img-link img-link-zoom-in img-thumb img-lightbox" target="_blank" href="{{ url('/') }}assets/media/photos/photo24@2x.jpg">
                                <img class="img-fluid" src="{{ url('/') }}assets/media/photos/photo24.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn">
                            <a class="img-link img-link-zoom-in img-thumb img-lightbox" target="_blank" href="{{ url('/') }}assets/media/photos/photo25@2x.jpg">
                                <img class="img-fluid" src="{{ url('/') }}assets/media/photos/photo25.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn">
                            <a class="img-link img-link-zoom-in img-thumb img-lightbox" target="_blank" href="{{ url('/') }}assets/media/photos/photo26@2x.jpg">
                                <img class="img-fluid" src="{{ url('/') }}assets/media/photos/photo26.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn">
                            <a class="img-link img-link-zoom-in img-thumb img-lightbox" target="_blank" href="{{ url('/') }}assets/media/photos/photo27@2x.jpg">
                                <img class="img-fluid" src="{{ url('/') }}assets/media/photos/photo27.jpg" alt="">
                            </a>
                        </div>
                        <div class="col-md-6 col-lg-4 col-xl-3 animated fadeIn">
                            <a class="img-link img-link-zoom-in img-thumb img-lightbox" target="_blank" href="{{ url('/') }}assets/media/photos/photo28@2x.jpg">
                                <img class="img-fluid" src="{{ url('/') }}assets/media/photos/photo28.jpg" alt="">
                            </a>
                        </div>
                    </div>
                    <!-- END Simple Gallery -->

                    <!-- Music -->
                    <h2 class="content-heading">
                        <!--<button type="button" class="btn btn-sm btn-rounded btn-alt-secondary float-right">View More..</button>-->
                        <i class="si si-note mr-5"></i> Music
                    </h2>
                    <a class="block block-rounded block-link-shadow" href="javascript:void(0)">
                        <div class="block-content block-content-full">
                            <p class="font-size-sm text-muted float-sm-right mb-5"><em>3:30</em></p>
                            <h4 class="font-size-default text-primary mb-0">
                                <i class="fa fa-music text-muted mr-5"></i> 5 things
                            </h4>
                        </div>
                    </a>
                    <a class="block block-rounded block-link-shadow" href="javascript:void(0)">
                        <div class="block-content block-content-full">
                            <p class="font-size-sm text-muted float-sm-right mb-5"><em>2:42</em></p>
                            <h4 class="font-size-default text-primary mb-0">
                                <i class="fa fa-music text-muted mr-5"></i> Soul Sand
                            </h4>
                        </div>
                    </a>
                    <a class="block block-rounded block-link-shadow" href="javascript:void(0)">
                        <div class="block-content block-content-full">
                            <p class="font-size-sm text-muted float-sm-right mb-5"><em>2:42</em></p>
                            <h4 class="font-size-default text-primary mb-0">
                                <i class="fa fa-music text-muted mr-5"></i> 10 Important things I wish I knew
                            </h4>
                        </div>
                    </a>
                    <a class="block block-rounded block-link-shadow" href="javascript:void(0)">
                        <div class="block-content block-content-full">
                            <p class="font-size-sm text-muted float-sm-right mb-5"><em>2:42</em></p>
                            <h4 class="font-size-default text-primary mb-0">
                                <i class="fa fa-music text-muted mr-5"></i> Bringing your productivity back
                            </h4>
                        </div>
                    </a>
                    <a class="block block-rounded block-link-shadow" href="javascript:void(0)">
                        <div class="block-content block-content-full">
                            <p class="font-size-sm text-muted float-sm-right mb-5"><em>2:42</em></p>
                            <h4 class="font-size-default text-primary mb-0">
                                <i class="fa fa-music text-muted mr-5"></i> Super Smooth
                            </h4>
                        </div>
                    </a>
                    <!-- END Articles -->
                </div>
                <!-- END Main Content -->
                <!-- END Page Content -->

            </main>
            <!-- END Main Container -->