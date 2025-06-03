package Controlador;

import java.io.IOException;
import java.util.List;

import DaoImpl.EmpresaDaoImpl;
import DaoImpl.PuestoDaoImpl;
import Modelo.Empresa;
import Modelo.oferta_practica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author MILTON - SUAREZ
 */
@WebServlet(name = "EmpresaServlet", urlPatterns = { "/Empresa" })
public class EmpresaServlet extends HttpServlet {

    PuestoDaoImpl puestoDAO = new PuestoDaoImpl();
    EmpresaDaoImpl empresaDAO = new EmpresaDaoImpl();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/paginas/iniciar_sesion.jsp");
            return;
        }

        String rol = (String) session.getAttribute("rol");
        if (!"estudiante".equals(rol)) {
            response.sendRedirect(request.getContextPath() + "/paginas/iniciar_sesion.jsp");
            return;
        }

        List<Empresa> empresas = empresaDAO.listarEmpresas();
        request.setAttribute("empresas", empresas);
        request.getRequestDispatcher("/paginas/listar-empresas.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String accion = request.getParameter("accion");
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String requisitos = request.getParameter("requisitos");
        String fechaLimite = request.getParameter("fechaLimite");
        String vacantes = request.getParameter("vacantes");
        int idUsuario = (int) session.getAttribute("idUsuario");

        if (accion != null && accion.equals("agregarOferta")) {
            oferta_practica oferta = new oferta_practica();
            Empresa empresa = empresaDAO.obtenerPorUsuarioId(idUsuario);
            if (empresa != null) {
                System.out.println("ID empresa: " + empresa.getId_empresa());
            } else {
                System.out.println("No se encontró empresa para el usuario con id: " + idUsuario);
            }
            oferta.setTitulo(titulo);
            oferta.setDescripcion(descripcion);
            oferta.setRequisitos(requisitos);
            oferta.setFecha_limite(fechaLimite);
            oferta.setVacantes(Integer.parseInt(vacantes));
            oferta.setId_empresa(empresa.getId_empresa());

            boolean resultado = puestoDAO.insertar(oferta);

            if (resultado) {
                response.sendRedirect(request.getContextPath() + "/PerfilEmpresa");
            } else {
                request.setAttribute("error", "Error al insertar la oferta.");
                request.getRequestDispatcher("paginas/perfil-empresa.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/paginas/iniciar_sesion.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
