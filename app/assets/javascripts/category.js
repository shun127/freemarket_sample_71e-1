$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    let html = `<option value="${category.id}" data-category="${category.name}">${category.name}</option>`;
    return html;
  };

  //子カテゴリーのHTML
  function appendChildrenBox(insertHTML) {
    var childSelectHtml = '';
    childSelectHtml = `<div class='box-new__category__wrapper' id='children_wrapper'>
                        <select class="box-new__category__wrapper-select" id="child_category" name="item[category_id]">
                          <option value="---" data-category="---">選択してください</option>
                          ${insertHTML}
                        </select>
                      </div>`;
    $('.box-new__category__wrapper').append(childSelectHtml);
  };

  //孫カテゴリーのHTML
  function appendGrandchildrenBox(insertHTML) {
    let grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='box-new__category__wrapper' id='grandchildren_wrapper'>
                              <select class="box-new__category__wrapper-select" id="grandchild_category" name="item[category_id]">
                                <option value="---" data-category="---">選択してください</option>
                                ${insertHTML}
                              </select>
                            </div>`;
    // console.log(insertHTML)
    $('#children_wrapper').append(grandchildSelectHtml);
    console.log(grandchildSelectHtml)
  };

  //親カテゴリー選択によるイベント
  $('#parent-category').on('change', function(){
    //選択された親カテゴリーの名前取得し、コントローラーに送る
    let parentCategory = $('#parent-category').val()
    if (parentCategory != "---"){ 
      $.ajax({
        url: 'category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        //親カテゴリーが変更されたら、子以下削除
        $('#children_wrapper').remove(); 
        $('#grandchildren_wrapper').remove();
        let insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); 
      $('#grandchildren_wrapper').remove();
    };
  });

  // 子カテゴリー選択によるイベント
  $('.box-new__category__wrapper').on('change', '#child_category', function(){
    //選択された子カテゴリーのID取得し、コントローラーに送る
    // let childId = $('#child_category option:selected').data('category');
    let childId = document.getElementById('child_category').value;
    console.log(childId)
    if (childId != "---"){ 
      $.ajax({
        url: 'category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        //子カテゴリーが変更されたら、孫削除
        $('#grandchildren_wrapper').remove(); 
        let insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
    };
  });
});