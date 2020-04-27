
            <!-- Main Container -->
            <main id="main-container">

                <!-- Page Content -->
                <div class="content">
                    {{ flashSession.output() }}

                    <div class="my-100 text-center">
                        <h2 class="font-w700 text-black mb-10">
                            Halo, {{ auth.name }}!
                        </h2>
                        <h3 class="h5 text-muted mb-0">
                            Selamat Datang di Dengar.in!
                        </h3>
                    </div>
                </div>
                <!-- END Page Content -->

            </main>
            <!-- END Main Container -->