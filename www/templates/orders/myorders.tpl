<?php # СТРАНИЧКА ВСЕХ ЗАКАЗОВ ПОЛЬЗОВАТЕЛЯ ?>
<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-2 mb-50">
					<span>Мои заказы</span>
				</div>
				<?php if (empty($myOrders)) { ?>
					<div class="highlight">
						<div class="title-2">У вас пока нет заказов</div>
					</div>
				<?php } ?>
				<table class="table">
					<tbody>
						<?php foreach ($myOrders as $order) { ?>
						<?php include ROOT . "templates/orders/_myorder-item-in-table.tpl" ?>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>