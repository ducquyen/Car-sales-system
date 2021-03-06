<?php echo $header; ?>
<div class="container">
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
    <?php } ?>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
            <div class="row">
                <div class="col-sm-4">
                    <h2><?php echo $text_my_account; ?></h2>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                        <li class="list-group-item"><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                        <li class="list-group-item"><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                        <!-- <li class="list-group-item"><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>-->
                    </ul>
                </div>
                <?php if ($credit_cards) { ?>
                <div class="col-sm-4">
                    <h2><?php echo $text_credit_card; ?></h2>
                    <ul class="list-group">
                        <?php foreach ($credit_cards as $credit_card) { ?>
                        <li class="list-group-item"><a href="<?php echo $credit_card['href']; ?>"><?php echo $credit_card['name']; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>
                <?php } ?>
                <div class="col-sm-4">
                    <h2><?php echo $text_my_orders; ?></h2>
                    <ul class="list-group">
                        <li class="list-group-item"><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                        <li class="list-group-item"><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                        <!-- <li class="list-group-item"><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                         <?php if ($reward) { ?>
                         <li class="list-group-item"><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
                         <?php } ?>
                         <li class="list-group-item"><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                         <li class="list-group-item"><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                         <li class="list-group-item"><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>-->
                        <!-- /****** Message System Starts *****/ -->
                        <li class="list-group-item"><a href="<?php echo $message; ?>"><?php echo $text_message_system; ?>
                                <span class="alert_messages">
                                    <?php if($alert_messages) { ?> 
                                    <b><?php echo $alert_messages ?></b>
                                    <?php } ?>
                                </span>
                            </a>
                        </li>
                        <!-- /****** Message System Ends *****/ -->
                    </ul>
                </div>
                <!-- <div class="col-sm-4">
                   <h2><?php echo $text_my_newsletter; ?></h2>
                   <ul class="list-group">
                     <li class="list-group-item"><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                   </ul>
                 </div>-->
            </div>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>
