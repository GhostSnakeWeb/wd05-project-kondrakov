$(document).ready(function() {

	/* For custom file inputs
			Based on code
			by Osvaldas Valutis, www.osvaldas.info (Available for use under the MIT License)
			and adapted for our project usage
	*/
	$( '.load-file-fieldset' ).each( function() {
		var $input	 = $( this ).find('.inputfile'),
			$caption = $( this ).find( '.file__inner-caption' ),
			$captionVal = $caption.html();

		$input.on( 'change', function( e )
		{
			console.log(e.target.value);
			var fileName = '';

			if( this.files && this.files.length > 1 )
				fileName = ( this.getAttribute( 'data-multiple-caption' ) || '' ).replace( '{count}', this.files.length );
			else if( e.target.value )
				fileName = e.target.value.split( '\\' ).pop();

			if( fileName )
				$caption.html( fileName );
			else
				$caption.html( captionVal );
		});
	});

});