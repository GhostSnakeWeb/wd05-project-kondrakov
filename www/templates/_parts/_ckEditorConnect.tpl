<script src="<?=HOST?>libs/ckeditor/ckeditor.js"></script>
<script>
	// Аналог $(document).ready(function(){}
	document.addEventListener('DOMContentLoaded', function(){ 
		  CKEDITOR.replace('ckEditor', {
			customConfig: '<?=HOST?>templates/assets/js/ckEditorConfig.js'
		});
	});
</script>