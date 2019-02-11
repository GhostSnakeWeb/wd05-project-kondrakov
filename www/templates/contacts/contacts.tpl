<div class="sticky-footer-content">
	<div class="container user-content pt-80 pb-80">
		<div class="row">
			<?php 
				//Если пришел массив GET с result
				if (isset($_GET['result'])) {
					include ROOT . 'templates/contacts/_results.tpl';
				}
			?>
			<div class="col contacts-links">
				<?php if (isAdmin()) { ?> 
					<div class="contacts-links__button"><a class="button button-edit" href="<?=HOST?>contacts-edit">Редактировать</a></div>
					<div class="contacts-links__button"><a class="button" href="<?=HOST?>messages">Сообщения</a></div>
				<?php } ?>	
			</div>
		</div>
		
		<?php #ДЛЯ АДРЕСА, EMAIL И ТЕЛЕФОНА ПРОВЕРКА НЕ ВАЖНА, Т.К. ОНИ ДОЛЖНЫ БЫТЬ ВСЕГДА ?>

		<?php
		//Шаблон для элементов страницы Контакты, чтобы не дублировать код
		function showContactItem($name, $title) {
			global $contacts;
			if (@$contacts[$name] != '') { ?>
				<div class="row">
					<div class="col-4 contacts__name"><?=$title?></div>
					<div class="col-6 contacts__value contacts__value--link">
						<?php if ($name == 'email') { ?>
							<a class="contacts__value--link" target="_blank" href="mailto:<?=$contacts[$name]?>"><?=$contacts[$name]?></a>
						<?php } else if ($name == 'phone') { ?>
							<a class="contacts__value--link" target="_blank" href="tel:<?=$contacts[$name]?>"><?=$contacts[$name]?></a>
						<?php } else if ($name == 'skype') { ?>
							<a class="contacts__value--link" target="_blank" href="skype:<?=$contacts[$name]?>?chat"><?=$contacts[$name]?></a>
						<?php } else if ($name == 'github') { ?>
							<a class="contacts__value--link" target="_blank" href="<?=$contacts[$name]?>">Screamer4u</a>
						<?php } else { ?>
							<?=$contacts[$name]?>
						<?php } ?>
					</div>	
				</div>
			<?php } ?>
		<?php } ?>

		<div class="row">
			<div class="col-md-6 contacts">
				<div class="contacts__title">Контакты </div>
				<?php showContactItem('name', 'Имя') ?>
				<?php showContactItem('surname', 'Фамилия') ?>
				<?php showContactItem('email', 'Email') ?>
				<?php showContactItem('github', 'Github') ?>
				<?php showContactItem('skype', 'Skype') ?>
				<?php if ($contacts['fb'] != '' || $contacts['vk'] != '' || $contacts['twitter'] != '') { ?>
					<div class="row">
						<div class="col-4 contacts__name">Социальные сети</div>
						<div class="col-6 contacts__value">
							<?php if ($contacts['vk'] != '') { ?>
								<div class="contacts__value--bold-link"><a target="_blank" href="<?=$contacts['vk']?>">Профиль Вконтакте</a></div>
							<?php } ?>
							<?php if ($contacts['fb'] != '') { ?>
								<div class="contacts__value--bold-link"><a target="_blank" href="<?=$contacts['fb']?>">Профиль Facebook</a></div>	
							<?php } ?>
							<?php if ($contacts['twitter'] != '') { ?>
								<div class="contacts__value--bold-link"><a target="_blank" href="<?=$contacts['twitter']?>">Профиль Twitter</a></div>	
							<?php } ?>
						</div>
					</div>
				<?php } ?>
				<?php showContactItem('phone', 'Телефон') ?>
				<?php showContactItem('address', 'Адрес') ?>
			</div>
			<div class="col-md-4">
				<?php require ROOT . 'templates/_parts/_errors.tpl';?>
				<?php require ROOT . 'templates/_parts/_success.tpl';?>
				<form class="form-contact" method="POST" action="<?=HOST?>contacts" enctype="multipart/form-data">
					<div class="form-contact__title">Связаться со мной</div>
					<div class="form-contact__name"><input class="input-text" name="name" type="text" placeholder="Введите имя" /></div>
					<div class="form-contact__email"><input class="input-text" type="text" placeholder="Email" name="email" /></div>
					<div class="form-contact__message"><textarea name="message" class="textarea mt-10" type="text" placeholder="Сообщение"></textarea></div>
					<div class="form-contact__load-file">
						<div class="load-file-title">Прикрепить файл </div>
						<div class="load-file-opis">jpg, png, pdf, doc, весом до 2Мб.</div>
						<div class="load-file-fieldset"><input class="inputfile inputfile-rad" id="file" type="file" name="file" data-multiple-caption="{count} файлов выбрано" multiple="" /><label for="file">Выбрать файл</label><span class="file__inner-caption">Файл не выбран</span></div>
					</div>
					<div class="form-contact__save"><input class="button button-save" type="submit" value="Отправить" name="newMessage" /></div>
				</form>
			</div>
		</div>
	</div>
</div>