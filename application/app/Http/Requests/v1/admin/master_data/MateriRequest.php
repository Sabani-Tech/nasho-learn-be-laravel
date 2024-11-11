<?php

namespace App\Http\Requests\v1\admin\master_data;

use Illuminate\Foundation\Http\FormRequest;

class MateriRequest extends FormRequest
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
            'phase' => 'required|integer',
            'judul' => 'required|string',
            'isi' => 'required|string',
        ];
    }
}