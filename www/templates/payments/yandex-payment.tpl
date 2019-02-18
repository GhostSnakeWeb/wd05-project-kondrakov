<div class="sticky-footer-content">
    <div class="container user-content pt-80">
        <div class="row">
            <div class="col-10 offset-1">
                <div class="blog__header mt-40 mb-30">
                    <span>Оплата заказа</span>
                </div>
                <form method="POST" action="https://money.yandex.ru/quickpay/confirm.xml">
                    <input type="hidden" name="receiver" value="<?=YANDEX_WALLET?>">
                    <input type="hidden" name="formcomment" value="Онлайн покупка: <?=SITE_NAME?>">
                    <input type="hidden" name="short-dest" value="Онлайн покупка: <?=SITE_NAME?>">
                    <input type="hidden" name="label" value="<?=$_SESSION['order']['id']?>">
                    <input type="hidden" name="quickpay-form" value="shop">
                    <input type="hidden" name="targets" value="Оплата в магазине <?=SITE_NAME?> заказ № <?=$_SESSION['order']['id']?>">
                    <input type="hidden" name="sum" value="<?=$_SESSION['order']['total_price']?>" data-type="number">
                    <!-- <input type="hidden" name="comment" value="Хотелось бы получить дистанционное управление.">
                    <input type="hidden" name="need-fio" value="true">
                    <input type="hidden" name="need-email" value="true">
                    <input type="hidden" name="need-phone" value="false">
                    <input type="hidden" name="need-address" value="false"> -->
                    <!-- <label><input type="radio" name="paymentType" value="PC">Яндекс.Деньгами</label> -->

                    <div class="control-row  mb-15">
                        <div class="radio">
                            <label class="radio__label">
                                <input class="radio__input" type="radio" name="paymentType" value="PC">
                                <span class="radio__check-inner"></span>
                                <span class="radio__check-inner-label">Яндекс.Деньгами</span>
                            </label>
                        </div>
                    </div> 

                    <div class="control-row mb-25">
                        <div class="radio">
                            <label class="radio__label">
                                <input class="radio__input" type="radio" name="paymentType" value="AC">
                                <span class="radio__check-inner"></span>
                                <span class="radio__check-inner-label">Банковской картой</span>
                            </label>
                        </div>
                    </div>

                    <!-- <label><input type="radio" name="paymentType" value="AC">Банковской картой</label> -->
                    <input class="button button-save" type="submit" value="Перевести">
                </form>
            </div>
        </div>
     </div>
</div>