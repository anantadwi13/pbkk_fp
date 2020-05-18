
            <!-- SignUp Container -->
            <div class="content content-full">
                <!-- Header -->
                <div class="px-30">
                    {{ flash.output() }}
                </div>
                <div class="px-30 py-10">
                    <a class="link-effect font-w700" href="{{ url('/') }}">
                        <i class="si si-fire"></i>
                        <span class="font-size-xl text-primary-dark">dengar.</span><span class="font-size-xl">in</span>
                    </a>
                    <h1 class="h3 font-w700 mt-30 mb-10">Create New Account</h1>
                    <h2 class="h5 font-w400 text-muted mb-0">Please add your details</h2>
                </div>
                <!-- END Header -->

                <!-- Sign Up Form -->
                <!-- jQuery Validation functionality is initialized with .js-validation-signup class in js/pages/op_auth_signup.min.js which was auto compiled from _es6/pages/op_auth_signup.js -->
                <!-- For more examples you can check out https://github.com/jzaefferer/jquery-validation -->
                <form class="js-validation-signup px-30" method="post">
                    <div class="form-group row">
                        <div class="col-12">
                            <div class="form-material floating">
                                <input type="text" class="form-control" id="username" name="username" value="{{ request.get('username') }}">
                                <label for="signup-username">Username</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-12">
                            <div class="form-material floating">
                                <input type="email" class="form-control" id="email" name="email" value="{{ request.get('email') }}">
                                <label for="signup-email">Email</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-12">
                            <div class="form-material floating">
                                <input type="text" class="form-control" id="name" name="name" value="{{ request.get('name') }}">
                                <label for="signup-email">Name</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-12">
                            <div class="form-material floating">
                                <input type="password" class="form-control" id="password" name="password">
                                <label for="signup-password">Password</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-12">
                            <div class="form-material floating">
                                <input type="password" class="form-control" id="password_confirm" name="password_confirm">
                                <label for="signup-password-confirm">Password Confirmation</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-12">
                            <div class="form-material floating">
                                <select class="form-control" id="account_type" name="account_type">
                                    <option></option>
                                    <option value="1">Sound</option>
                                    <option value="2">Amplifier</option>
                                </select>
                                <label for="material-select">Please Select</label>
                            </div>
                        </div>
                    </div>
{#                    <div class="form-group row">#}
{#                        <div class="col-12">#}
{#                            <div class="custom-control custom-checkbox">#}
{#                                <input type="checkbox" class="custom-control-input" id="signup-terms" name="signup-terms">#}
{#                                <label class="custom-control-label" for="signup-terms">I agree to Terms &amp; Conditions</label>#}
{#                            </div>#}
{#                        </div>#}
{#                    </div>#}
                    <div class="form-group">
                        <button type="submit" class="btn btn-sm btn-hero btn-alt-success">
                            <i class="fa fa-plus mr-10"></i> Create Account
                        </button>
                        <div class="mt-30">
                            <a class="link-effect text-muted mr-10 mb-5 d-inline-block" href="{{ url('/signin') }}">
                                <i class="fa fa-user text-muted mr-5"></i> Sign In
                            </a>
                        </div>
                    </div>
                </form>
                <!-- END Sign Up Form -->
            </div>
            <!-- SignUp Container -->