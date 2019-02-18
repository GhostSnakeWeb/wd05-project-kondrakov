<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="blog__header mt-40 mb-30">
					<span>Оплата заказа</span>
				</div>
				
				<div class="highlight">
					<p><strong>Номер заказа: </strong>
						<?php echo $order['id'] ?>
					</p>
					<p><strong>Сумма заказа:</strong>
						<?php echo price_format($order['total_price']) ?>руб.</p>
				</div>

				<div class="title-2 mb-50">
					<span>Выбирете способ оплаты</span>
				</div>
				<div class="card mb-30 user-content">
					<div class="card__title">Система Яндекс.Деньги</div>
					<p>Для оплаты с помощью:</p>
					<ul>
						<li>Карт Visa, MasterCard, МИР</li>
						<li>или с кошелька Яндекс деньги.</li>
					</ul>
					<a href="payment-yandex" class="card__select">Выбрать</a>
				</div>

				<div class="card mb-30 user-content">
					<div class="card__title">Система WebMoney</div>
					<p>Для оплаты с помощью:</p>
					<ul>
						<li>WebMoney рубли</li>
						<li>WebMoney доллары</li>
					</ul>
					<a href="#" class="card__select">Выбрать</a>
				</div>
			</div>
		</div>
	</div>
</div>