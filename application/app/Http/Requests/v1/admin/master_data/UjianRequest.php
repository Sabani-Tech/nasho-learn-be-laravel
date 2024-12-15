<?php

namespace App\Http\Requests\v1\admin\master_data;

use Illuminate\Foundation\Http\FormRequest;

class UjianRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title' => 'required|string',
            'question' => 'required|string',
            'point' => 'required|integer',
            'kategori_materi_id' => 'required|string',
            'phase' => 'integer|required',
            'batch' => 'required|integer',
            'option' => 'required|string',
        ];
    }
}
