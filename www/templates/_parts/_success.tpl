<?php 

foreach ($success as $item) {
	if (count($item) == 1) { ?>
		<!-- Однострочная ошибка -->
		<div class="notification__success mb-20 mt-20"><?=$item['title']?></div> 
<?php } else if (count($item) == 2) { ?>
		<!-- Ошибка с описанием --> 
		<div class="registration-form__error">
			<div class="notification__error--text">
				<div class="notification__success notification__error--top notification__error--top-border-radius"><?=$item['title']?></div>
				<?=$item['desc']?>
			</div>
		</div>
<?php } }?>