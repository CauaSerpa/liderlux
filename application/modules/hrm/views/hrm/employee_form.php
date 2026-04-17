
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-bd lobidrag">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4><?php echo html_escape($title) ?> </h4>
                        </div>
                    </div>
                  
                    <div class="panel-body">

                         <?php echo form_open_multipart('employee_form/'.$employee->id,'id="validate"') ?>
                         <input type="hidden" name="id" id="id" value="<?php echo $employee->id?>">
                    <div class="form-group row">
                        <label for="first_name" class="col-sm-2 col-form-div"><?php echo display('first_name') ?> <i class="text-danger">*</i></label>
                        <div class="col-sm-4">
                            <input name="first_name" class="form-control" type="text" placeholder="<?php echo display('first_name') ?>" required id="first_name" value="<?php echo $employee->first_name?>">
                            <input type="hidden" name="old_first_name" value="<?php echo $employee->first_name?>">
                        </div>
                         <label for="last_name" class="col-sm-2 col-form-div"><?php echo display('last_name') ?> <i class="text-danger">*</i></label>
                        <div class="col-sm-4">
                            <input name="last_name" class="form-control" type="text" placeholder="<?php echo display('last_name') ?>" required id="last_name" value="<?php echo $employee->last_name?>">
                            <input type="hidden" name="old_last_name" value="<?php echo $employee->last_name?>">
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="phone" class="col-sm-2 col-form-div"><?php echo display('phone') ?></label>
                        <div class="col-sm-4">
                            <input name="phone" class="form-control" type="number" placeholder="<?php echo display('phone') ?>" id="phone" value="<?php echo $employee->phone?>">
                        </div>
                         <label for="fee" class="col-sm-2 col-form-div"><?php echo display('fee') ?></label>
                        <div class="col-sm-4">
                            <input name="fee" class="form-control" type="number" min="1" max="100" placeholder="<?php echo display('fee') ?>" id="fee" value="<?php echo $employee->fee?>">
                        </div>
                    </div>
                    <div class="form-group row">
                         <label for="ie" class="col-sm-2 col-form-div"><?php echo display('IE') ?></label>
                        <div class="col-sm-4">
                            <input name="ie" class="form-control" type="text" placeholder="<?php echo display('IE') ?>" id="ie" value="<?php echo $employee->ie?>">
                        </div>
                    </div>
                 <hr>
                     <div class="form-group row">
                     <label for="zip" class="col-sm-2 col-form-div"><?php echo display('zip') ?></label>
                        <div class="col-sm-4">
                            <input name="zip" class="form-control" type="text" placeholder="<?php echo display('zip') ?>" value="<?php echo $employee->zip?>" id="zip">
                        </div>
                    <label for="address_line_1" class="col-sm-2 col-form-div"><?php echo display('address_line_1') ?></label>
                        <div class="col-sm-4">
                            <input name="address_line_1" class="form-control" type="text" placeholder="<?php echo display('address_line_1') ?>" id="address_line_1" value="<?php echo $employee->address_line_1?>">
                        </div>
                        
                    </div>
                 
                <div class="form-group row">
                 <label for="city" class="col-sm-2 col-form-div"><?php echo display('city') ?></label>
                        <div class="col-sm-4">
                            <input name="city" class="form-control" type="text" placeholder="<?php echo display('city') ?>" id="city" value="<?php echo $employee->city?>">
                            
                        </div>
                 </div>
                 <hr>
                    <div class="form-group row">
                    <label for="picture" class="col-sm-2 col-form-div"><?php echo display('picture') ?></label>
                        <div class="col-sm-4">
                            <input type="file" name="image" class="form-control"  placeholder="<?php echo display('picture') ?>" id="image">
                            <input type="hidden" name="old_image" value="<?php echo $employee->image?>">
                        </div>
                         
                    </div>
                    <div class="form-group row">
                        <label for="email" class="col-sm-2 col-form-div"><?php echo display('email') ?> <i class="text-danger">*</i></label>
                        <div class="col-sm-4">
                            <input name="email" class="form-control" type="email" placeholder="<?php echo display('email') ?>" id="email" value="<?php echo $employee->email?>" required>
                        </div>
                        <label for="password" class="col-sm-2 col-form-label text-d"><?php echo display('password') ?> <?php if(!isset($employee)){echo '<i class="text-danger">*</i>';} ?></label>
                        <div class="col-sm-4">
                            <input name="password" class="form-control" type="password" placeholder="<?php echo display('password') ?>" <?php if(!isset($employee)){echo 'required';} ?> id="password">
                            <input name="oldpassword" class="form-control" type="hidden" value="<?php echo $user->password ?>">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="user_type" class="col-sm-2 col-form-label">
                            <?php echo display('product_table_location') ?> <span class="text-danger">*</span>
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" name="user_type" id="user_type" required>
                                <option value=""><?php echo display('select_one') ?></option>
                                <?php
                                foreach($user_list as $data){
                                    ?>
                                    <option value="<?php echo $data['id'] ?>" <?php if($employee->user_type == $data['id']){echo 'selected';} ?>><?php echo $data['type'] ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group text-right">
                        <button type="reset" class="btn btn-primary w-md m-b-5"><?php echo display('reset') ?></button>
                        <button type="submit" class="btn btn-success w-md m-b-5"><?php echo display('save') ?></button>
                    </div>
                <?php echo form_close() ?>
                    </div>
                
                </div>
            </div>
        </div>
 