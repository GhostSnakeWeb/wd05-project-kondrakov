<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-md-10 offset-md-1">
				<div class="title-1">Сообщения от посетителей</div>
				
				<?php foreach ($messages as $message) { 
					include ROOT . "templates/contacts/message-card.tpl";
				} ?>
			</div>
		</div>
	</div>
</div>