package com.kazinak.main;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

public class CSVServlet extends HttpServlet {
    private static final String FILE_PATH = "/csv/receivedData.csv";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = null;
        FileWriter writer = null;
        try {
            File file = createCsvFile(FILE_PATH);
            writer = new FileWriter(file, true);
            out = response.getWriter();
            String[] data = request.getParameterValues("forms[]");
            Map<String, String> map;
            for (int i = 0; i < data.length; i++) {
                map = parseQuery(data, i);
                String parseData = writeFromMapToString(map);
                writer.append(parseData).append("\n");
            }
            out.println(FILE_PATH);
        } catch (Exception ex) {
            out.println(ex.getMessage());
        } finally {
            if (writer != null) {
                writer.flush();
                writer.close();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    private String parseDateForCsv(String date) {
        StringBuilder format = new StringBuilder(date);
        String year = format.substring(date.length() - 6, date.length() - 2);
        String quarter = format.substring(0, 1);
        return new String(year + "-" + quarter);
    }

    private HashMap<String, String> parseQuery(String[] data, int row) throws UnsupportedEncodingException {
        HashMap<String, String> map = new HashMap<String, String>();
        for (String pair : data[row].split("&")) {
            int idxOfEqual = pair.indexOf("=");
            if (idxOfEqual < 0) {
                map.put(pair, "");
            } else {
                String key = URLDecoder.decode(pair.substring(0, idxOfEqual), "UTF-8");
                String value = URLDecoder.decode(pair.substring(idxOfEqual + 1), "UTF-8");
                if (key.equals("address"))
                    value = "\"" + value + "\"";
                if (key.equals("period"))
                    value = parseDateForCsv(value);
                map.put(key, value);
            }
        }
        return map;
    }

    private String writeFromMapToString(Map<String, String> map) {
        String result = "";
        for (String value : map.values()) {
            result += value + ";";
        }
        return result.substring(0, result.length() - 1).replaceAll("^\"|\"$", "");
    }

    private File createCsvFile(String path) throws IOException {
        ServletContext ctx = getServletContext();
        String realPath = ctx.getRealPath(path);
        File file = new File(realPath);
        if (file.exists()) {
            file.delete();
        }
        file.createNewFile();
        return file;
    }
}
