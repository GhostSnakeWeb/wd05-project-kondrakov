<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-2 mb-50">
					<span>Состав заказа</span>
				</div>
				<table class="table cart-table">
					<thead>
						<tr class="table-total">
							<td></td>
							<td>Наименование</td>
							<td>Количество</td>
							<td width="200">Стоимость за ед.</td>
							<td width="200">Стоимость всего</td>
							<td></td>
						</tr>
					</thead>
					<tfoot>
						<tr class="table-total">
							<td></td>
							<td></td>
							<td><strong><?=$cartGoodsCount?> шт.</strong></td>
							<td></td>
							<td><strong><?=price_format($cartGoodsTotalPrice)?> руб.</strong></td>
							<td></td>
						</tr>
					</tfoot>
					<tbody>
						<?php foreach ($cartGoods as $item) { ?>
						<?php include ROOT . "templates/cart/_cart-item-in-table.tpl" ?>
						<?php } ?>
					</tbody>
				</table>
				<div class="blog__header mt-40 mb-30">
					<span>Оформить заказ</span>
				</div>
				<form action="<?=HOST?>order-create" method="POST">
					<div class="row">
						<div class="col-6">
							<div class="post-add-form__name">
								<label class="label">Имя
									<?php if (isset($_SESSION['logged_user']['name'])) { ?>
										<input class="input-text" type="text" placeholder="Введите имя" name="name" value="<?=$_SESSION['logged_user']['name']?>" />
									<?php } else { ?>
										<input class="input-text" type="text" placeholder="Введите имя" name="name" />
									<?php } ?>
								</label>
							</div>
						</div>
						<div class="col-6">
							<div class="post-add-form__name">
								<label class="label">Фамилия
									<?php if (isset($_SESSION['logged_user']['surname'])) { ?>
										<input class="input-text" type="text" placeholder="Введите фамилию" name="surname" value="<?=$_SESSION['logged_user']['surname']?>" />
									<?php } else { ?>
										<input class="input-text" type="text" placeholder="Введите фамилию" name="surname" />
									<?php } ?>
								</label>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<div class="post-add-form__name">
								<label class="label">Email
									<?php if (isset($_SESSION['logged_user']['email'])) { ?>
										<input class="input-text" type="text" placeholder="Введите email" name="email" value="<?=$_SESSION['logged_user']['email']?>" />
									<?php } else { ?>
										<input class="input-text" type="text" placeholder="Введите email" name="email" />
									<?php } ?>
								</label>
							</div>
						</div>
						<div class="col-6">
							<div class="post-add-form__name">
								<label class="label">Телефон
									<input class="input-text" type="text" placeholder="Введите телефон" name="phone" value="555-55-55" />
								</label>
							</div>
						</div>
					</div>
					<label class="label">Адрес доставки
						<input class="input-text" type="text" placeholder="Введите адрес доставки" name="address" />
					</label>
					<div class="post-add-form-button">
						<input class="button button-save" type="submit" value="Оформить заказ" name="createOrder" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>