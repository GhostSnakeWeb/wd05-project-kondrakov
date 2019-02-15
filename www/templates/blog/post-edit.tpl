<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<?php if (isset($_GET['result'])) {
					include ROOT . 'templates/blog/_results.tpl';
				} ?>
				<div class="title-1 post-add__title">Редактировать пост</div>
				<?php require ROOT . 'templates/_parts/_errors.tpl';?>
				<form id="editForm" class="post-add-form" action="<?=HOST?>blog/post-edit?id=<?=$post['id']?>" method="POST" enctype="multipart/form-data">
					<div class="post-add-form__name">
						<label class="label">Название<input class="input-text" type="text" placeholder="Введите название" name="postTitle" value="<?=$post['title']?>" />
						</label>
					</div>
					<div class="mt-30">
						<label class="label">Категория</label>
						<select name="postCat" class="mt-10">
							<?php #Проверяем если номер категории поста совпадает с id категории, то делаем этот option selected ?>
							<?php foreach ($cats as $cat): ?>
								<option 
									value="<?=$cat['id']?>" <?echo ($post['cat'] == $cat['id'])?"selected":"";?>>
									<?=$cat['cat_title']?>		
								</option>
							<?php endforeach ?>
						</select>
					</div>
					<div class="post-add-form__file">
						<div class="load-file-title">Изображение </div>
						<div class="load-file-opis">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</div>
						<div class="load-file-fieldset"><input class="inputfile" id="file-2" type="file" name="postImg" data-multiple-caption="{count} файлов выбрано" multiple="" /><label for="file-2">Выбрать файл</label><span class="file__inner-caption">Файл не выбран</span></div>
						<div class="load-file-wrap">
							<div class="load-file-wrap-img">
								<img id="image_preview" class="load-file-wrap-img__image" src="" />
							</div>
						</div>
						<?php if ($post['post_img_small'] != ""){ ?>
							<div class="load-file-wrap">
								<div class="load-file-wrap-img">
									<img class="load-file-wrap-img__image" src="<?=HOST?>usercontent/blog/<?=$post['post_img_small']?>" alt="<?=$post['title']?>" />
									<div class="load-file-wrap__button">
										<input type="hidden" value="<?=$post['id']?>">
										<input class="button button-delete button-small" type="submit" value="Удалить" name="picDelete"/>
									</div>
								</div>
							</div>
						<?php } ?>
					</div>		
					<div class="post-add-form__textarea"><label class="label"><p>Содержание</p><textarea class="textarea" id="ckEditor" type="text" placeholder="Введите описание" name="postText"><?=$post['text']?></textarea>
					<?php 
						//Подключаем текстовый редактор через шаблон
						include_once ROOT . "templates/_parts/_ckEditorConnect.tpl";
					?>
					</label></div>
					<div class="post-add-form-button"><input class="button button-save" type="submit" value="Сохранить" name="postUpdate" />
						<div class="post-add-form-button__cancel"><a class="button" href="<?=HOST?>blog">Отмена</a></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>