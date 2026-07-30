import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSocialEpidemiologyTheoremCanonicalLaneLean

structure DirectedAcyclicGraph where
  nodes : Type
  edges : nodes → nodes → Prop
  acyclicity : ∀ n, ¬(edges n n) ∧ (∀ l, edges n l → ¬(edges l n))

structure DirectedAcyclicGraphEvidence (G : DirectedAcyclicGraph) where
  acyclicityClosed : G.acyclicity

def DirectedAcyclicGraphClosed (G : DirectedAcyclicGraph) : Prop :=
  G.acyclicity

theorem dag_closed_from_evidence (G : DirectedAcyclicGraph) (E : DirectedAcyclicGraphEvidence G) :
    DirectedAcyclicGraphClosed G := by
  exact E.acyclicityClosed

end MedicineSocialEpidemiologyTheoremCanonicalLaneLean
end HautevilleHouse