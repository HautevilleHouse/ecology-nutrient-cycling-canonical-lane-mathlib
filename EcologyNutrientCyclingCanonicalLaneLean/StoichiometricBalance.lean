import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

structure StoichiometricBalancePackage where
  carbonNitrogenRatio : Prop
  nitrogenPhosphorusRatio : Prop
  organicMatterQuality : Prop
  microbialEfficiency : Prop
  nutrientImmobilization : Prop

def StoichiometricBalanceClosed (S : StoichiometricBalancePackage) : Prop :=
  S.carbonNitrogenRatio ∧ S.nitrogenPhosphorusRatio ∧
  S.organicMatterQuality ∧ S.microbialEfficiency ∧
  S.nutrientImmobilization

theorem stoichiometric_balance_closed_from_evidence
    (S : StoichiometricBalancePackage) (E : StoichiometricBalanceEvidence S) :
    StoichiometricBalanceClosed S := by
  exact And.intro E.carbonNitrogenRatioClosed
    (And.intro E.nitrogenPhosphorusRatioClosed
      (And.intro E.organicMatterQualityClosed
        (And.intro E.microbialEfficiencyClosed
          E.nutrientImmobilizationClosed)))

structure StoichiometricBalanceEvidence (S : StoichiometricBalancePackage) where
  carbonNitrogenRatioClosed : S.carbonNitrogenRatio
  nitrogenPhosphorusRatioClosed : S.nitrogenPhosphorusRatio
  organicMatterQualityClosed : S.organicMatterQuality
  microbialEfficiencyClosed : S.microbialEfficiency
  nutrientImmobilizationClosed : S.nutrientImmobilization

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse
