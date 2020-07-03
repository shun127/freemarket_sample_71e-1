$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  };

  //子カテゴリーのHTML
  function appendChildrenBox(insertHTML) {
    var childSelectHtml = '';
    childSelectHtml = 
      `<select class="box-new__categories__children" id="child_category" name="category_id">
        <option value="" data-category="" >選択してください</option>
        ${insertHTML}
      </select>`;
    $('#children_box').append(childSelectHtml);
    console.log("test");
  };

  //孫カテゴリーのHTML
  function appendGrandchildrenBox(insertHTML) {
    let grandchildSelectHtml = '';
    grandchildSelectHtml = 
      `<select class="box-new__categories__grandchildren--select" id="grandchild_category" name="item[category_id]">
        <option value="" data-category="" >選択してください</option>
        ${insertHTML}
      </select>`;
    $('#grandchildren_box').append(grandchildSelectHtml);
  };

  //親カテゴリー選択によるイベント
  $('#parent-category').on('change', function(){
    //選択された親カテゴリーの名前取得し、コントローラーに送る
    var parentCategory = $('#parent-category').val()
    console.log(parentCategory);
    if (parentCategory != ""){ 
      $.ajax({
        url: 'category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        //親カテゴリーが変更されたら、子以下削除
        $('#children_box').remove(); 
        $('#grandchildren_box').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_box').remove(); 
      $('#grandchildren_box').remove();
    };
  });
});