//[W.I.P]
// function zipReader(){
// if (directory_exists("Custom Songs/"))
//     {   
//         var _f=file_text_open_append("zip.log")
//         var rootPath="";
//         var zipList=[];
//         var zipPath = file_find_first("Custom Songs/*.zip", 16);
//         while (zipPath!=""){
//             array_push(zipList,zipPath);
//             rootPath=string_copy(zipPath,1,string_last_pos("/",zipPath));
//             file_text_write_string(_f,rootPath);
//             //zip_unzip(zipPath,"Custom Songs/")
//             zipPath=file_find_next();
//         }
//         file_text_close(_f);

//         var f2=file_text_open_append(rootPath+"success.txt");
//         file_text_write_string(f2,"ohads");
//         file_text_close(f2);

//     }
// }