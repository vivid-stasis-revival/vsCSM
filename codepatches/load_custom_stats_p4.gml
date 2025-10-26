if (!is_custom_chart)
        {
            data = parseSongDataFromBinary(binName, arg0, arg3, arg1 == "ENCORE");
        }
        else
        {
            data = parseSongDataFromText(arg0, arg0, arg3, arg1 == "ENCORE", arg1);
        }