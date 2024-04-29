import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatelessWidget')
      ),
      body: Padding(
        padding: const EdgeInsets.all(20), // パディング
        child: Column(
          children: [
            const Expanded( // 画面いっぱいに引き伸ばし
              child: Text(
                overflow: TextOverflow.fade,
                maxLines: 30,
                'むかし、むかし、あるところに浦島太郎という心やさしい漁師が住んでいました。\n'
                'ある日のこと、浜辺を歩いていると一匹の亀が子供達にいじめられているのを見ました。\n'
                '「これこれ、かめをいじめたらかわいそうだよ。はなしておやり」\n'
                'そう言って浦島太郎は子供たちから亀を助けてやりました。\n'
                '数日すぎたある日、浦島太郎がいつものようにつりをしていると亀が海から出てきて、\n'
                '「浦島太郎さん、僕はこの間あなたから助けられた亀です。お姫様があなたを竜宮城におつれしなさいというのでお迎えにまいりました。」\n'
                '「竜宮城へつれていってくれるのかい。それなら、少し行ってみようか。」\n'
                '浦島太郎はさっそく亀のこうらに乗ると海の中に入っていきました。\n'
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('戻る'),
            ),
          ]
        ),
      ),
    );
  }
}