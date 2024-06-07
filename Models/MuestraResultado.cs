public class MuestraResultado {
    public int IdResultado { get; set; }
    public int IdMuestra { get; set; }
    public string TshNeonatal { get; set; }
    public string MetodologiaTsh { get; set; }
    public string Fenilanina { get; set; }
    public string MetodologiaFenilanina { get; set; }
    public string IrtNeonatal { get; set; }
    public string MetodologiaIrt { get; set; }
    public string Galactosa { get; set; }
    public string MetodologiaGalactosa { get; set; }
    public string Hidroxiprogesterona { get; set; }
    public string MetodologiaHidro { get; set; }
    public string Biotinidasa { get; set; }
    public string MetodologiaBiotinidasa { get; set; }
    public string NormalidadTsh { get; set; }
    public string NormalidadFenilanina { get; set; }
    public string NormalidadIrt { get; set; }
    public string NormalidadGalactosa { get; set; }
    public string NormalidadHidro { get; set; }
    public string NormalidadBiotinidasa { get; set; }
    public string Observaciones { get; set; }

    // Constructor vacío
    public MuestraResultado() {}

    // Constructor con parámetros
    public MuestraResultado(int idResultado, int idMuestra, string tshNeonatal, string metodologiaTsh, string fenilanina, string metodologiaFenilanina, string irtNeonatal, string metodologiaIrt, string galactosa, string metodologiaGalactosa, string hidroxiprogesterona, string metodologiaHidro, string biotinidasa, string metodologiaBiotinidasa, string normalidadTsh, string normalidadFenilanina, string normalidadIrt, string normalidadGalactosa, string normalidadHidro, string normalidadBiotinidasa, string observaciones) {
        IdResultado = idResultado;
        IdMuestra = idMuestra;
        TshNeonatal = tshNeonatal;
        MetodologiaTsh = metodologiaTsh;
        Fenilanina = fenilanina;
        MetodologiaFenilanina = metodologiaFenilanina;
        IrtNeonatal = irtNeonatal;
        MetodologiaIrt = metodologiaIrt;
        Galactosa = galactosa;
        MetodologiaGalactosa = metodologiaGalactosa;
        Hidroxiprogesterona = hidroxiprogesterona;
        MetodologiaHidro = metodologiaHidro;
        Biotinidasa = biotinidasa;
        MetodologiaBiotinidasa = metodologiaBiotinidasa;
        NormalidadTsh = normalidadTsh;
        NormalidadFenilanina = normalidadFenilanina;
        NormalidadIrt = normalidadIrt;
        NormalidadGalactosa = normalidadGalactosa;
        NormalidadHidro = normalidadHidro;
        NormalidadBiotinidasa = normalidadBiotinidasa;
        Observaciones = observaciones;
    }
}