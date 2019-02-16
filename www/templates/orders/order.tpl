<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-2 mb-50">
					<span>Состав заказа № <?=$order->id?></span>
				</div>
				<table class="table">
					<tbody>
						<?php foreach ($orders as $order) { ?>
						<?php include ROOT . "templates/orders/_order-item-in-table.tpl" ?>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>