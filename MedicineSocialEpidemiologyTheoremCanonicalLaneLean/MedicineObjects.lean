import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure MedicineSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MedicineAdmittedObject where
  space : MedicineSpace
  populationClosed : Prop
  epidemiologicalModelExists : Prop
  healthOutcome : Type
  healthOutcomeTopology : TopologicalSpace healthOutcome
  measurableOutcome : Prop
  conclusion : measurableOutcome

structure MedicineEndgameState where
  object : MedicineAdmittedObject

def MedicineWitnessClosed (O : MedicineAdmittedObject) : Prop :=
  O.measurableOutcome

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse
