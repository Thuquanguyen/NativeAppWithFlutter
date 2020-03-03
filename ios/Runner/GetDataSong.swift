//
//  GetDataSong.swift
//  Runner
//
//  Created by ThuNQ-D1 on 3/3/20.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import AVFoundation
import UIKit
import Flutter
import MediaPlayer

@available(iOS 9.3, *)
class GetDataSong {
    var albums: [AlbumInfo] = []
    var songQuery: SongQuery = SongQuery()
    var audio: AVAudioPlayer?

    func getSong(result: FlutterResult){
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.albums = self.songQuery.get(songCategory: "")
                DispatchQueue.main.async {
                 for data in self.albums{
                     print("- \(data.albumTitle)\n")
                     for song in data.songs {
                         print("\t+ \(song.songTitle)\n")
                     }
                 }
                }
            }
        }
        result("Size = \(self.albums.count)")
    }
    
}
