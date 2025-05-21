package Controlador;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import okhttp3.*;
import org.json.JSONObject;

@MultipartConfig
public class ControladorImg extends HttpServlet {

    private static final String CLIENT_ID = "347a156f56b111c"; // Tu Client-ID de Imgur
    private static final String IMGUR_UPLOAD_URL = "https://api.imgur.com/3/image";

    String subirImg = "vistas/subirImg.jsp";
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Manejo de navegación entre vistas
        String acceso = "";
        String action = request.getParameter("accion");

        if (action == null) {
            action = "mostrarFormulario"; // Acción por defecto
        }

        switch (action) {
            case "subirImg":
                acceso = subirImg;
                break;

            default:
                break;
        }

        request.getRequestDispatcher(acceso).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener el archivo del formulario
        Part filePart = request.getPart("image");
        File tempFile = File.createTempFile("SubirImg", ".jpg");
        filePart.write(tempFile.getAbsolutePath());

        // Subir la imagen a Imgur
        String imageUrl = uploadToImgur(tempFile);

        // Eliminar el archivo temporal
        if (tempFile.exists()) {
            tempFile.delete();
        }

        // Enviar la URL de la imagen a la página de subida sin redirigir
        request.setAttribute("imageUrl", imageUrl);
        request.getRequestDispatcher("/vistas/subirImg.jsp").forward(request, response);
    }

    private String uploadToImgur(File imageFile) throws IOException {
        byte[] fileContent = Files.readAllBytes(imageFile.toPath());
        String encodedString = Base64.getEncoder().encodeToString(fileContent);

        OkHttpClient client = new OkHttpClient();
        RequestBody body = new FormBody.Builder().add("image", encodedString).build();
        Request request = new Request.Builder()
                .url(IMGUR_UPLOAD_URL)
                .addHeader("Authorization", "Client-ID " + CLIENT_ID)
                .post(body)
                .build();

        Response response = client.newCall(request).execute();
        if (!response.isSuccessful()) {
            throw new IOException("Error en la subida a Imgur: " + response);
        }

        String jsonResponse = response.body().string();
        JSONObject jsonObject = new JSONObject(jsonResponse);
        return jsonObject.getJSONObject("data").getString("link");
    }

    @Override
    public String getServletInfo() {
        return "Controlador de navegación y subida de imágenes a Imgur";
    }
}
