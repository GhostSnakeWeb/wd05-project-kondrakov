<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">
				<div class="title-1 post-add__title">Добавить пост</div>
				<?php require ROOT . 'templates/_parts/_errors.tpl';?>
				<form class="post-add-form" action="<?=HOST?>blog/post-new" method="POST" enctype="multipart/form-data">
					<div class="post-add-form__name">
						<label class="label">Название<input class="input-text" type="text" placeholder="Введите название" name="postTitle" />
						</label>
					</div>
					<div class="mt-30">
						<label class="label">Категория</label>
						<select name="postCat" class="mt-10">
							<?php foreach ($cats as $cat): ?>
								<option value="<?=$cat['id']?>"><?=$cat['cat_title']?></option>
							<?php endforeach ?>
						</select>
					</div>
					<div class="post-add-form__file">
						<div class="load-file-title">Изображение </div>
						<div class="load-file-opis">Изображение jpg или png, рекомендуемая ширина 945px и больше, высота от 400px и более, вес до 2Мб.</div>
						<div class="load-file-fieldset"><input class="inputfile" id="file-2" type="file" name="postImg" data-multiple-caption="{count} файлов выбрано" multiple="" /><label for="file-2">Выбрать файл</label><span class="file__inner-caption">Файл не выбран</span></div>
					</div>
					<div class="post-add-form__textarea"><label class="label"><p>Содержание</p><textarea class="textarea" id="ckEditor" type="text" placeholder="Введите описание" name="postText"></textarea>
					<?php 
						//Подключаем текстовый редактор через шаблон
						include_once ROOT . "templates/_parts/_ckEditorConnect.tpl";
					?>
					</label></div>
					<div class="post-add-form-button"><input class="button button-save" type="submit" value="Сохранить" name="postNew" />
						<div class="post-add-form-button__cancel"><a class="button" href="<?=HOST?>blog">Отмена</a></div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>