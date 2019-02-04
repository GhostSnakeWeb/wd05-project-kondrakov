<div class="sticky-footer-content">
	<div class="container user-content pt-80">
		<div class="row">
			<div class="col-10 offset-1">

				<?php 
					//Если пришел массив GET с result
					if (isset($_GET['result'])) {
						include ROOT . 'templates/categories/_results.tpl';
					}
				?>

				<div class="blog__header mb-50">
					<span>Роли пользователей</span>
					<a class="button button-edit" href="<?=HOST?>roles/new-role">Добавить роль</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-10 offset-1">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">id</th>
							<th scope="col">Имя</th>
							<th scope="col">Фамилия</th>
							<th scope="col">Email</th>
							<th scope="col">Роль</th>
							<th scope="col">Изменить</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($roles as $user): ?>				
							<tr>
								<th><?=$user['id']?></th>
								<td><?=$user['name']?></td>
								<td><?=$user['surname']?></td>
								<td><?=$user['email']?></td>
								<td><?=$user['role']?></td>
								<td><a href="<?=HOST?>roles/edit-role?id=<?=$user['id']?>">Изменить роль</a></td>
							</tr>
						<?php endforeach ?>
					</tbody>
				</table>
			</div>
		</div>
		<div class="container user-content pt-80">
			<div class="row">
				<div class="col-10 offset-1">
					<div class="blog__header mb-50">
						<span>Доступные роли</span>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-10 offset-1">
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">id</th>
								<th scope="col">Название ролей</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($allRoles as $role): ?>				
								<tr>
									<th><?=$role['id']?></th>
									<td><?=$role['role_name']?></td>
								</tr>
							<?php endforeach ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>