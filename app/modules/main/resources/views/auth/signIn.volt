
            <!-- SignIn Container -->
            <div class="content content-full">
                <div class="px-30">
                    {{ flashSession.output() }}
                </div>
                <!-- Header -->
                <div class="px-30 py-10">
                    <a class="link-effect font-w700" href="{{ url('/') }}">
                        <i class="si si-fire"></i>
                        <span class="font-size-xl text-primary-dark">dengar.</span><span class="font-size-xl">in</span>
                    </a>
                    <h1 class="h3 font-w700 mt-30 mb-10">Welcome to Your Dashboard</h1>
                    <h2 class="h5 font-w400 text-muted mb-0">Please sign in</h2>
                </div>
                <!-- END Header -->

                <!-- Sign In Form -->
                <!-- jQuery Validation functionality is initialized with .js-validation-signin class in js/pages/op_auth_signin.min.js which was auto compiled from _es6/pages/op_auth_signin.js -->
                <!-- For more examples you can check out https://github.com/jzaefferer/jquery-validation -->
                <form class="js-validation-signin px-30" method="post">
                    <input type="hidden" name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                    <div class="form-group row">
                        <div class="col-12">
                            <div class="form-material floating">
                                <input type="text" class="form-control" id="login-username" name="login-username" value="{{ request.getPost('login-username') }}">
                                <label for="login-username">Username</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-12">
                            <div class="form-material floating">
                                <input type="password" class="form-control" id="login-password" name="login-password">
                                <label for="login-password">Password</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-12">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="login-remember-me" name="login-remember-me">
                                <label class="custom-control-label" for="login-remember-me">Remember Me</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-sm btn-hero btn-alt-primary">
                            <i class="si si-login mr-10"></i> Sign In
                        </button>
                        <div class="mt-30">
                            <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="{{ url('/signup') }}">
                                <i class="fa fa-plus mr-5"></i> Create Account
                            </a>
                            <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="#">
                                <i class="fa fa-warning mr-5"></i> Forgot Password
                            </a>
                        </div>
                    </div>
                </form>
                <!-- END Sign In Form -->
            </div>
            <!-- SignIn Container -->