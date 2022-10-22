import type { StoreonModule } from 'storeon'

interface RegisterFormFields {
  language: string
  regType: string
  firstName: string
  lastName: string
  dob: Date | string
  email: string
  phone: string
  province: string
  school: string
  educationLevel: string
}

export interface FormStore {
  form: {
    register: {
      currentStep: number
      fields?: Partial<RegisterFormFields>
    }
  }
}

export interface FormEvent {
  'form/register/nextStep': void
  'form/register/prevStep': void
  'form/register/setFields': Partial<RegisterFormFields>
  'form/register/reset': void
}

export const form: StoreonModule<FormStore, FormEvent> = (store) => {
  store.on('@init', () => ({
    form: {
      register: {
        currentStep: 1,
        fields: {},
      },
    },
  }))

  store.on('form/register/nextStep', (store, event) => ({
    form: {
      ...store.form,
      register: {
        ...store.form.register,
        currentStep: store.form.register.currentStep + 1,
      },
    },
  }))

  store.on('form/register/prevStep', (store, event) => ({
    form: {
      ...store.form,
      register: {
        ...store.form.register,
        currentStep: store.form.register.currentStep - 1,
      },
    },
  }))

  store.on('form/register/setFields', (store, fields) => ({
    form: {
      ...store.form,
      register: {
        ...store.form.register,
        fields: {
          ...store.form.register.fields,
          ...fields,
        },
      },
    },
  }))

  store.on('form/register/reset', (store, event) => ({
    form: {
      ...store.form,
      register: {
        currentStep: 1,
        fields: {},
      },
    },
  }))
}
