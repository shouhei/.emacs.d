
((digest . "1e8adf59e89ceeba3667daba3c9eaa46") (undo-list nil ("[" . -291) nil ("i" . -292) nil ("]" . -293) ((marker*) . 1) ((marker) . -1) nil ("[" . -294) nil ("'" . -295) nil ("n" . -296) nil ("a" . -297) nil ("m" . -298) nil ("e" . -299) nil ("'" . -300) nil ("]" . -301) (t 21454 13935 0 0) ((marker*) . 1) ((marker) . -1) nil ("{" . -243) nil ("
" . -244) nil ("
" . -245) nil (" " . -246) nil (" " . -247) nil (" " . -248) nil (" " . -249) nil (" " . -250) nil (" " . -251) nil (" " . -252) nil (" " . -253) nil (" " . -254) nil (" " . -255) nil ("
" . -260) nil ("
" . -261) nil (" " . -262) nil (" " . -263) nil (" " . -264) nil (" " . -265) nil (" " . -266) nil (" " . -267) nil (" " . -268) nil (" " . -269) nil ("}" . -270) (t 21454 13922 0 0) ((marker*) . 1) ((marker) . -1) nil (385 . 386) nil (384 . 385) nil (nil rear-nonsticky nil 383 . 384) (nil fontified nil 355 . 384) (nil fontified nil 350 . 355) (nil fontified nil 306 . 350) (nil fontified nil 305 . 306) (nil fontified nil 174 . 305) (nil fontified nil 1 . 174) (1 . 384) nil ("$(function(){

  $(\".search\").on('click',function(){

    var data = new Object();

    data['name'] = $(\"select[name=Language]\").val();

    //-----ここからが問題

    $.post(\"./function.php\", data, function(data){

        // 戻り値の処理が指定されていない。設定すべきdivなどがあるべきでは?

        // あとfunction.phpには?>がないのでは?

        // dataの初期化が{}で直接指定されていないのはなぜでしょう。

        // あとgetLLdataでforeachでリストの先頭を取り出しているのは

        // 気持ちが悪いのですが。特にパラメータが不正な場合に戻り値が

        // 適当なのかどうか。    

    });

    return false;

    //---ここまでが問題

  });

});
" . 1) (t 21454 13859 0 0) ((marker . 243) . -502) ((marker . 1) . -513) ((marker . 1) . -170) ((marker . 1) . -170) ((marker . 1) . -513) nil ("J" . -169) nil ("S" . -170) nil ("O" . -171) nil ("N" . -172) (t 21454 13844 0 0) nil undo-tree-canary))
