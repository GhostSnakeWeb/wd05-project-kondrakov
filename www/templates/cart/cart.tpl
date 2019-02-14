<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<?php if (count(@$cartGoods) > 0) { ?>
					<div class="blog__header mb-50">
						<span>Корзина</span>
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
				<?php } else { ?>
					<div class="highlight">
						<div class="title-2">Корзина пуста</div>
					</div>
				<?php } ?>
			</div>
		</div>
	</div>
</div>