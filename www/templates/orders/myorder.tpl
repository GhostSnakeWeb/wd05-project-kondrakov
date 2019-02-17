<?php # СТРАНИЧКА ОТДЕЛЬНОГО ЗАКАЗА ДЛЯ ПОЛЬЗОВАТЕЛЯ ?>
<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-2 mb-50">
					<span>Состав заказа № <?=$order->id?></span>
				</div>
				<table class="table table-hover">
					<thead>
						<tr class="table-total">
							<td>Наименование</td>
							<td>Количество</td>
							<td width="200">Стоимость</td>
						</tr>
					</thead>
					<tfoot>
						<tr class="table-total">
							<td></td>
							<td scope="row">
								<strong>
									<?=$order->items_count?> товаров</strong>
							</td>
							<td>
								<strong>
									<?=price_format($order->total_price)?> рублей</strong>
							</td>
						</tr>
					</tfoot>
					<tbody>
						<?php foreach ($orderItems as $item) { ?>
						<?php include ROOT . "templates/orders/_item-in-order-table-history.tpl" ?>
						<?php } ?>
					</tbody>
				</table>
				<a href="<?=HOST?>myorders" class="button">← Назад к моим заказам</a>
			</div>
		</div>
	</div>
</div>