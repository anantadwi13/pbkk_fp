
            <!-- Main Container -->
            <main id="main-container">

                <!-- Page Content -->
                <div class="content">

                    <div class="row">
                        <div class="col-md-6 offset-md-3">
                            {{ flashSession.output() }}
                            <!-- Static Labels -->
                            <div class="block">

                                <div class="block-header block-header-default">
                                    <h3 class="block-title">Add New Event</h3>
                                </div>
                                <div class="block-content">
                                    <form method="post">
                                        <input hidden name="{{ security.getTokenKey() }}" value="{{ security.getToken() }}">
                                        <p class="p-10 bg-info-light">
                                            If you have any event without Amplifier, you can insert it here!
                                        </p>
                                        <div class="form-group row">
                                            <div class="col-md-9">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="name"
                                                           name="name" value="{{ request.get('name') }}">
                                                    <label for="name">Event Name</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-12">
                                                <div class="form-material">
                                                    <textarea class="form-control" id="description"
                                                              name="description" rows="3" placeholder="Optional">{{ request.get('description') }}</textarea>
                                                    <label for="description">Description</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-8">
                                                <div class="form-material">
                                                    <input type="text" class="js-datepicker form-control" id="start_date"
                                                           name="start_date" data-week-start="1" data-autoclose="true"
                                                           data-today-highlight="true" data-date-format="yyyy-mm-dd"
                                                           autocomplete="off"
                                                           placeholder="yyyy-mm-dd" value="{{ request.get('start_date') }}">
                                                    <label for="start_date">Start Date</label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-material">
                                                    <input type="text" class="js-masked-time form-control"
                                                           id="start_time" name="start_time" placeholder="__:__"
                                                           autocomplete="off"
                                                           value="{{ request.get('start_time') }}">
                                                    <label for="start_time">Start Time</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-8">
                                                <div class="form-material">
                                                    <input type="text" class="js-datepicker form-control" id="end_date"
                                                           name="end_date" data-week-start="1" data-autoclose="true"
                                                           data-today-highlight="true" data-date-format="yyyy-mm-dd"
                                                           autocomplete="off"
                                                           placeholder="yyyy-mm-dd" value="{{ request.get('end_date') }}">
                                                    <label for="end_date">End Date</label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-material">
                                                    <input type="text" class="js-masked-time form-control"
                                                           id="end_time" name="end_time" placeholder="__:__"
                                                           autocomplete="off"
                                                           value="{{ request.get('end_time') }}">
                                                    <label for="end_time">End Time</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-md-9">
                                                <div class="form-material">
                                                    <input type="text" class="form-control" id="location"
                                                           name="location" value="{{ request.get('location') }}">
                                                    <label for="location">Location</label>
                                                </div>
                                            </div>
                                        </div>
{#                                        <div class="form-group row">#}
{#                                            <div class="col-lg-8">#}
{#                                                <div class="form-material">#}
{#                                                    <select class="js-select2 form-control" id="status"#}
{#                                                            name="status[]" style="width: 100%;"#}
{#                                                            data-placeholder="Choose many.." multiple>#}
{#                                                        <option></option>#}
{#                                                        <option value="{{ constant('Dengarin\Main\Models\User::ROLE_AMPLIFIER') }}">HTML</option>#}
{#                                                        <option value="2">CSS</option>#}
{#                                                        <option value="3">JavaScript</option>#}
{#                                                        <option value="4">PHP</option>#}
{#                                                        <option value="5">MySQL</option>#}
{#                                                        <option value="6">Ruby</option>#}
{#                                                        <option value="7">AngularJS</option>#}
{#                                                    </select>#}
{#                                                    <label for="status">Multiple Values</label>#}
{#                                                </div>#}
{#                                            </div>#}
{#                                        </div>#}
                                        <div class="form-group row">
                                            <div class="col-md-9">
                                                <button type="submit" class="btn btn-alt-primary">Submit</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- END Static Labels -->
                        </div>
                    </div>

                </div>
                <!-- END Page Content -->

            </main>
            <!-- END Main Container -->