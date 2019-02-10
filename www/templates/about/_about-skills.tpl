<?php function showIndicator($title, $value, $color = '') { 

	//Длина и ширина svg холста
	$indicatorWidth = 125;
	//Радиус
	$radius = 56;
	//pi - возвращает число pi
	$perimetr = 2 * pi() * $radius;
	// Рассчитываем stroke-dashoffset
	$offset = $perimetr * (1 - intval($value)/100);

	?>
	<div class="indicator">
		<svg 
			height="<?=$indicatorWidth?>" 
			width="<?=$indicatorWidth?>" 
			viewbox="0 0 <?=$indicatorWidth?> <?=$indicatorWidth?>">
			<circle 
				<?php //Если не передаем цвет
					if ($color == '') { ?>
						class="circle" 
				<? } else { ?>
						class="circle circle-<?=$color?>"
				<? } ?> 
					stroke-dasharray="<?=$perimetr?>";
					r="<?=$radius?>"
					cx="62"
  					cy="62"
					stroke-dashoffset="<?=$offset?>">
			</circle>
		</svg>
		<div class="indicator__value"><?=$title?></div>
	</div>
<?php } ?>

<div id="about-technology" class="bg-technology">
	<div class="container user-content">
		<div class="technology">
			<div class="row">
				<div class="col-md-9 offset-md-3">
					<div class="technology-block">
						<div class="technology-block__title">Технологии<span>Которые использую в работе</span></div>
						<?php if (isAdmin()) { ?> 
							<div class="technology-block__button"><a class="button button-edit" href="<?=HOST?>edit-skills">Редактировать</a></div>
						<?php } ?>
					</div>
				</div>
			</div>
			<!-- Green indicators -->
			<div class="row mb-40">
				<div class="col-md-3 technology__title d-flex align-items-center justify-content-center">Frontend</div>
				<div class="col-md-9">
					<?php showIndicator('HTML5', $skills['html'], 'green') ?>
					<?php showIndicator('CSS3', $skills['css'], 'green') ?>
					<?php showIndicator('JS', $skills['js'], 'green') ?>
					<?php showIndicator('jQuery', $skills['jquery'], 'green') ?>
				</div>
			</div>
			<!-- Blue indicators -->
			<div class="row mb-40">
				<div class="col-md-3 technology__title d-flex align-items-center justify-content-center">Backend</div>
				<div class="col-md-9">
					<?php showIndicator('PHP', $skills['php'], 'blue') ?>
					<?php showIndicator('MySql', $skills['mysql'], 'blue') ?>
				</div>
			</div>
			<!-- Yellow indicators -->
			<div class="row">
				<div class="col-md-3 technology__title d-flex align-items-center justify-content-center">Workflow</div>
				<div class="col-md-9">
					<?php showIndicator('Git', $skills['git'], 'yellow') ?>
					<?php showIndicator('Gulp', $skills['gulp'], 'yellow') ?>
					<?php showIndicator('Yarn', $skills['yarn'], 'yellow') ?>
					<?php showIndicator('Npm', $skills['npm'], 'yellow') ?>
				</div>
			</div>
		</div>
	</div>
</div>