
            <!-- Main Container -->
            <main id="main-container">

                <!-- Page Content -->
                <div class="bg-image" style="background-image: url('{{ url('/') }}assets/media/photos/photo44.jpg');">
                    <div class="hero bg-primary-dark-op">
                        <div class="hero-inner">
                            <div class="content content-full text-center">
                                <div class="col-md-6 offset-md-3" data-toggle="appear" data-class="animated fadeInDown">
                                    {{ flashSession.output() }}
                                </div>
                                <h2 class="display-4 font-w700 text-white mb-10 invisible" data-toggle="appear" data-class="animated fadeInDown">
                                    Halo, {{ auth.name }}!
                                </h2>
                                <h3 class="font-w400 text-white-op mb-50 invisible" data-toggle="appear" data-class="animated fadeInUp" data-timeout="250">
                                    Selamat Datang di Dengar.in!
                                </h3>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Page Content -->

            </main>
            <!-- END Main Container -->