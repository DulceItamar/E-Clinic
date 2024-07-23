package com.c19_136_swift.MedicalConnect.domain.doctor;

public enum MedicalSpeciality {
    ALERGOLOGIA_INMUNOLOGIA("Alergología e Inmunología"),
    CARDIOLOGIA("Cardiología"),
    DERMATOLOGIA("Dermatología"),
    NUTRICION ("Nutrición"),

    ENDOCRINOLOGIA("Endocrinología"),
    MEDICINA_FAMILIAR("Medicina Familiar"),
    GASTROENTEROLOGIA("Gastroenterología"),

    MEDICINA_INTERNA("Medicina Interna"),
    ENFERMEDADES_INFECCIOSAS("Enfermedades Infecciosas"),
    NEFROLOGIA("Nefrología"),
    NEUROLOGIA("Neurología"),
    OBSTETRICIA_Y_GINECOLOGIA("Obstetricia y Ginecología"),
    OTORRINOLARINGOLOGIA("Otorrinolaringología"),
    ONCOLOGIA("Oncología"),
    ORTOPEDIA("Ortopedia"),
    PATOLOGIA("Patología"),
    PEDIATRIA("Pediatría"),
    MEDICINA_FISICA_Y_REHABILITACION("Medicina Física y Rehabilitación"),
    CIRUGIA_PLASTICA("Cirugía Plástica"),
    PSIQUIATRIA("Psiquiatría"),
    PSICOLOGIA("Psicología"),
    NEUMOLOGIA("Neumología"),
    RADIOLOGIA("Radiología"),
    REUMATOLOGIA("Reumatología"),
    MEDICINA_DEL_DEPORTE("Medicina del Deporte"),

    UROLOGIA("Urología"),

    OTRO("Otra categoría");




    private String getSpecialtyInSpanish;

    MedicalSpeciality(String getSpecialtyInSpanish){
        this.getSpecialtyInSpanish = getSpecialtyInSpanish;
    }

    public static MedicalSpeciality fromSpanish(String text) {
        for (MedicalSpeciality medicalSpeciality : MedicalSpeciality.values()){
            if (medicalSpeciality.getSpecialtyInSpanish.equalsIgnoreCase(text)){
                return medicalSpeciality;
            }
        }
        throw new IllegalArgumentException("Ninguna especialidad encontrada "+ text);
    }

}
