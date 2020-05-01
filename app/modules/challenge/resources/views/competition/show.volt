            <!-- Main Container -->
            <main id="main-container">

                <!-- Hero -->
                <div class="bg-image" style="background-image: url('{{url("/")}}challenge_competition/{{competition.image}}');">
                    <div class="bg-black-op-75">
                        <div class="content content-top text-center">
                            <div class="py-100">
                                <h1 class="font-w700 text-white mb-10">{{competition.title}}</h1>
                                <h2 class="h4 font-w400 text-white-op">{{competition.duedate}}</h2>
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

                <!-- Responses -->
                <div class="bg-body-dark">
                    <div class="content content-full">
                        <div class="row justify-content-center py-30">
                            <div class="col-lg-8">
                                <h3 class="font-w700 mb-50">Your Submission</h3>
                                <div class="media mb-30">
                                    <img class="img-avatar img-avatar48 d-flex mr-20" src="assets/media/avatars/avatar2.jpg" alt="">
                                    <div class="media-body">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END Responses -->

            </main>
            <!-- END Main Container -->