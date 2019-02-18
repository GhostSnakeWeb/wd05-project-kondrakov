<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-1 post-add__title">Редактировать товар</div>
				<?php require ROOT . 'templates/_parts/_errors.tpl';?>
				<?php if (isset($_GET['result'])) {
					include ROOT . 'templates/blog/_results.tpl';
				} ?>
				<form class="post-add-form" action="<?=HOST?>shop/item-edit?id=<?=$item['id']?>" method="POST" enctype="multipart/form-data">
					<div class="post-add-form__name">
						<label class="label">Название
							<input class="input-text" type="text" value="<?=$item['title']?>" placeholder="Введите название" name="title" />
						</label>
					</div>
					<div class="row mt-20">
						<div class="col">
							<div class="post-add-form__name">
								<label class="label">Цена
									<input class="input-text" value="<?=$item['price']?>" type="text" placeholder="Введите цену" name="price" />
								</label>
							</div>
						</div>
						<div class="col">
							<div class="post-add-form__name">
								<label class="label">Старая цена									
									<input 
										class="input-text" 
										type="text" 
										placeholder="Введите старую цену" 
										name="priceOld"
										<?php if ($item['price_old'] != "") { ?>
											value="<?=$item['price_old']?>"
										<?php }	?> />
								</label>
							</div>
						</div>
					</div>
					<div class="post-add-form__file">
						<div class="load-file-title">Изображение</div>
						<div class="load-file-opis">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</div>
						<div class="load-file-fieldset">
							<input class="inputfile" id="file-2" type="file" name="itemImg" data-multiple-caption="{count} файлов выбрано" multiple="" />
							<label for="file-2">Выбрать файл</label>
							<span class="file__inner-caption">Файл не выбран</span>
						</div>
						<?php if ($item['img_small'] != ""){ ?>
							<div class="load-file-wrap">
								<div class="load-file-wrap-img">
									<img class="load-file-wrap-img__image" src="<?=HOST?>usercontent/shop/<?=$item['img_small']?>" alt="<?=$item['title']?>" />
									<div class="load-file-wrap__button-shop">
										<input class="button button-delete button-small" type="submit" value="Удалить" name="shopEditPicDelete"/>
									</div>
								</div>
							</div>
						<?php } ?>
					</div>
					<div class="post-add-form__textarea">
						<label class="label">
							<p>Описание</p>
							<textarea class="textarea" id="ckEditor" type="text" placeholder="Введите описание" name="itemDesc"><?=$item['desc']?></textarea>
							<?php 
								//Подключаем текстовый редактор через шаблон
								include_once ROOT . "templates/_parts/_ckEditorConnect.tpl";
							?>
						</label>
					</div>
					<div class="post-add-form-button">
						<input class="button button-save" type="submit" value="Сохранить" name="itemUpdate" />
						<div class="post-add-form-button__cancel">
							<a class="button" href="<?=HOST?>shop">Отмена</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>