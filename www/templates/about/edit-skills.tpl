<?php function skillItem($name, $title) { 
	global $skills;
	?>
	<div class="col-md-3 technology-edit-form__item">
		<label class="label"><?=$title?><input class="input-text input-text--width" placeholder="50" value="<?=$skills[$name]?>" name="<?=$name?>" />
		</label>
		<div class="percent-sign"><span class="percent-sign__item">%</span></div>
	</div>
<?php } ?>

<div class="sticky-footer-content">
	<div class="container user-content pt-45 pl-0">
		<div class="row">
			<div class="offset-md-1 col-md-8">
				<h1 class="title-1">Редактировать - Технологии</h1>
				<?php require ROOT . "templates/_parts/_errors.tpl"; ?>
				<form class="technology-edit-form" action="<?=HOST?>edit-skills" method="POST">
					<div class="row technology-edit-form__row">
						<?php skillItem('html', 'HTML5') ?>
						<?php skillItem('css', 'CSS3') ?>
						<?php skillItem('js', 'JS') ?>
						<?php skillItem('jquery', 'jQuery') ?>	
					</div>
					<div class="row technology-edit-form__row">
						<?php skillItem('php', 'PHP') ?>
						<?php skillItem('mysql', 'MySql') ?>
					</div>
					<div class="row technology-edit-form__row mb-30">
						<?php skillItem('git', 'Git') ?>
						<?php skillItem('gulp', 'Gulp') ?>
						<?php skillItem('yarn', 'Yarn') ?>
						<?php skillItem('npm', 'Npm') ?>
					</div>
					<div class="row technology-edit-form__row">
						<div class="technology-edit-form__button"><input class="button button-save" type="submit" value="Сохранить" name="skillsUpdate" /></div>
						<div class="form-button-cancel"><a class="button" href="<?=HOST?>about#about-technology">Отмена</a></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>