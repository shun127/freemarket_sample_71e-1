          // .box__title
          //   %label 出品画像
          //   %span.box__title--required 必須
          // %p.box__file-info 最大10枚までアップロードできます
          // .box__file
          //   .box__file__img#img-box
          //   .box__file__field#file-box
          //     = f.fields_for :item_images do |i|
          //       = i.file_field :src, class: "box__file__field--file", data: {index: i.index}
          //     = icon('fa', 'camera')
          //     %p 
          //       クリックしてファイルをアップロード

          // .box-new__pic 
          //   .box-new__pic__prev#prev-box
          //   .box-new__pic__lable#label-box
          //     = f.fields_for :item_images do |i|
          //       = i.file_field :src, class: "box-new__pic__lable--file", data: {index: i.index}, id:"img-file"
          //     .icon-new
          //       = image_tag "material/icon/icon_camera.png", size: "20x18"
          //     .icon-new__inf ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード


$(function() {
  function buildImg(index, url) {
    var html = `<div class="box-new__pic__prev__wrapper" data-index="${index}">
                    <img data-index="${index}" src="${url}">
                    <div class="box-new__pic__prev__wrapper__delete" data-index="${index}">削除する</div>
                  </div>`;
    return html;
  }

  function buildFileField(index) {
    var html = `<input class="box-new__pic__lable--file" data-index="${index}" type="file" name="item[item_images_attributes][${index}][src]" id="item_item_images_attributes_${index}_src">`;
    return html;
  }

  function selectWidth(fileCount, num) {
    if (fileCount <= num) {
      const imgWidth = (fileCount) * 105;
      $('#prev-box').css({'width':`${imgWidth}px`});
      $('#label-box').css({'width':`calc(100% - ${imgWidth}px)`});
    } else {
      const imgWidth = 525;
      $('#prev-box').css({'width':`${imgWidth}px`});
      $('#label-box').css({'width':`calc(100% - ${imgWidth}px)`});
    }
  }
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.box-new__pic__lable--file:last').data('index');
  fileIndex.splice(0, lastIndex);
  var fileCount = 0;

  if ($('#label-box').data('edit') === "edit") {
    var fileCount = $('.box-new__pic__lable--file').length;
    $('#label-box').append(buildFileField(fileIndex[0] + 1));
    selectWidth(fileCount, 5);
  }

  $('#label-box').on('click', '.box-new__pic__lable--file', function(e) {
    if (fileCount > 9) {
      alert('最大10枚までです');
      return false;
    }
  });
  $('#label-box').on('change', '.box-new__pic__lable--file', function(e) {
    if (fileCount <= 9) {
          $('#label-box').append(buildFileField(fileIndex[0]));
          $(`#item_item_images_attributes_${fileIndex[0] - 1}_src`).hide();
      
          const file = e.target.files[0];
          const blobUrl = window.URL.createObjectURL(file);
          fileCount += 1;       
          selectWidth(fileCount, 5);
          $(buildImg(fileIndex[0] - 1, blobUrl)).appendTo($('#prev-box')).hide().fadeIn(300); 
          
          fileIndex.shift();
          fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
    console.log(buildFileField)
  });
  $('#prev-box').on('click', '.box-new__pic__prev__wrapper__delete', function(e) {
    const targetIndex = $(this).data('index');
    $(this).parent().remove();
    $(`#item_item_images_attributes_${targetIndex}_src`).remove();
    $(`#item_item_images_attributes_${targetIndex}__destroy`).prop('checked', true);
    fileCount -= 1;
    selectWidth(fileCount, 5);
  });
  $('#price-box').on('keyup change', '#price-box__price', function() {
    var price = $(this).val();
    var commission = Math.floor(price * 0.1);
    if (price > 0) {
      $('#price-box__commission').text(`¥${commission}`);
      $('#sell-profit').text(`¥${price - commission}`);
    } else {
      $('#price-box__commission').text("－");
      $('#sell-profit').text("－");     
    }
  });
  $('#edit_submit_button').on('click', function() {
    if (fileCount === 0) {
      var targetY = $('.header').offset().top;
      $('html, body').animate({ scrollTop: targetY }, 1200, 'swing');
      alert('画像が一枚もアップロードされていません');
      return false;
    }
  })
  $('#item-name-field').on('keyup change', function() {
    var textLength = $(this).val().length;
    $('#name-num').text(`${textLength}/40`);
  });
  $('#item-description-field').on('keyup change', function() {
    var textLength = $(this).val().length;
    $('#description-num').text(`${textLength}/1000`);
  });

})