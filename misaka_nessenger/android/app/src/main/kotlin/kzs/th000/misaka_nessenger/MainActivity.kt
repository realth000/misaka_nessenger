package kzs.th000.misaka_nessenger

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import MisakaNessengerServer.MisakaNessengerServer
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GlobalScope.launch(Dispatchers.Default) {
            MisakaNessengerServer.runServer()
        }
    }
}
